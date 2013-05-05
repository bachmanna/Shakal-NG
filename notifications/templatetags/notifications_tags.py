# -*- coding: utf-8 -*-
from django import template
from notifications.models import Inbox


register = template.Library()


@register.assignment_tag(takes_context = True)
def get_unread_notifications(context):
	user = context['request'].user
	if user.is_authenticated():
		return Inbox.objects.user_messages(user).filter(readed = False)[:99]
	else:
		return Inbox.objects.none()