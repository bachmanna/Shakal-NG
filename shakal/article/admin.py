# -*- coding: utf-8 -*-

from django.contrib import admin
from shakal.article.models import Category, Article

class CategoryAdmin(admin.ModelAdmin):
	list_display = ('name', 'slug', )
	search_fields = ('name', 'slug', )
	prepopulated_fields = {'slug': ('name', )}

class ArticleAdmin(admin.ModelAdmin):
	list_display = ('title', 'category', 'author', 'published', )
	search_fields = ('title', 'slug', )
	prepopulated_fields = {'slug': ('title', )}
	raw_id_fields = ('author', )
	exclude = ('display_count', )
	list_filter = ('published', 'top', 'category', )

admin.site.register(Category, CategoryAdmin)
admin.site.register(Article, ArticleAdmin)
