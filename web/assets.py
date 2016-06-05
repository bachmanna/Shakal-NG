# -*- coding: utf-8 -*-
from __future__ import unicode_literals

SPRITES = (
	{
		'name': 'sprites',
		'output': 'new/images/sprites.png',
		'scss_output': 'new/scss/_sprites.scss',
		'extra_sizes': ((2, '@2x'),),
		'width': 400,
		'height': 400,
		'images': (
			{ 'name': 'header_shadow', 'src': 'new/images/header_shadow.png', 'mode': 'repeat-x' },
		),
	},
	{
		'name': 'sprites',
		'output': 'default/images/backgrounds.png',
		'scss_output': 'default/_sprites.scss',
		'extra_sizes': (),
		'width': 800,
		'height': 1200,
		'images': (
			{ 'name': 'btn_std', 'src': 'default/images/btn_std.png' },
			{ 'name': 'btn_std_hover', 'src': 'default/images/btn_std_hover.png' },
			{ 'name': 'btn_act', 'src': 'default/images/btn_act.png' },
			{ 'name': 'btn_act_hover', 'src': 'default/images/btn_act_hover.png' },
			{ 'name': 'btn_content_std', 'src': 'default/images/btn_content_std.png' },
			{ 'name': 'btn_content_std_hover', 'src': 'default/images/btn_content_std_hover.png' },
			{ 'name': 'btn_content_act', 'src': 'default/images/btn_content_act.png' },
			{ 'name': 'btn_content_act_hover', 'src': 'default/images/btn_content_act_hover.png' },
			{ 'name': 'breadcrumb_panel_bg', 'src': 'default/images/breadcrumb_panel_bg.png', 'mode': 'repeat-x' },
			{ 'name': 'breadcrumb_std', 'src': 'default/images/breadcrumb.png' },
			{ 'name': 'breadcrumb_act', 'src': 'default/images/breadcrumb_act.png' },
			{ 'name': 'tabs_std', 'src': 'default/images/tabs_std.png' },
			{ 'name': 'tabs_act', 'src': 'default/images/tabs_act.png' },
			{ 'name': 'logo', 'src': 'default/images/logo.png' },
			{ 'name': 'avatar_placeholder', 'src': 'default/images/avatar_placeholder.png' },
			{ 'name': 'user_rating_0', 'src': 'default/images/rating_0.png' },
			{ 'name': 'user_rating_1', 'src': 'default/images/rating_1.png' },
			{ 'name': 'user_rating_2', 'src': 'default/images/rating_2.png' },
			{ 'name': 'user_rating_3', 'src': 'default/images/rating_3.png' },
			{ 'name': 'user_rating_4', 'src': 'default/images/rating_4.png' },
			{ 'name': 'user_rating_5', 'src': 'default/images/rating_5.png' },
			{ 'name': 'user_rating_admin', 'src': 'default/images/rating_admin.png' },
			{ 'name': 'facebook', 'src': 'images/facebook.png' },
			{ 'name': 'twitter', 'src': 'images/twitter.png' },
			{ 'name': 'gplus', 'src': 'images/gplus.png' },
			{ 'name': 'vybralisme', 'src': 'images/vybralisme.png' },
			{ 'name': 'breadcrumb_bg', 'src': 'default/images/breadcrumb_bg.png' },
			{ 'name': 'breadcrumb_bg_reverse', 'src': 'default/images/breadcrumb_bg_reverse.png' },
			{ 'name': 'breadcrumb_home', 'src': 'default/images/breadcrumb_home.png' },
			{ 'name': 'dropdown_icon_14', 'src': 'default/images/dropdown_icon_14.png' },
			{ 'name': 'profile_icon_14', 'src': 'default/images/profile_icon_14.png' },
			{ 'name': 'search_icon', 'src': 'default/images/search_icon.png' },
			{ 'name': 'rss_icon', 'src': 'default/images/rss_icon.png' },
			{ 'name': 'trashcan', 'src': 'default/images/trashcan.png' },
			{ 'name': 'corner_arrow_up', 'src': 'default/images/corner_arrow_up.png' },
			{ 'name': 'locked_icon', 'src': 'default/images/locked.png' },
			{ 'name': 'new_icon', 'src': 'default/images/new.png' },
			{ 'name': 'tick_icon', 'src': 'default/images/tick.png' },
			{ 'name': 'watch_icon', 'src': 'default/images/watch.png' },
			{ 'name': 'comment_icon_14', 'src': 'default/images/comment_icon_14.png' },
			{ 'name': 'watch_icon_14', 'src': 'default/images/watch_icon_14.png' },
			{ 'name': 'tick_icon_14', 'src': 'default/images/tick_icon_14.png' },
			{ 'name': 'lock_icon_14', 'src': 'default/images/lock_icon_14.png' },
			{ 'name': 'up_icon_14', 'src': 'default/images/up_icon_14.png' },
			{ 'name': 'down_icon_14', 'src': 'default/images/down_icon_14.png' },
			{ 'name': 'delete_icon_14', 'src': 'default/images/delete_icon_14.png' },
			{ 'name': 'settings_icon_14', 'src': 'default/images/settings_icon_14.png' },
			{ 'name': 'header_bg', 'src': 'default/images/header_bg.png', 'mode': 'repeat-x' },
			{ 'name': 'block_header_bg', 'src': 'default/images/block_header_bg.png', 'mode': 'repeat-x' },
			{ 'name': 'submit_row_bg', 'src': 'default/images/submit_row_bg.png', 'mode': 'repeat-x' },
			{ 'name': 'input_bg', 'src': 'default/images/input_bg.png', 'mode': 'repeat-x' },
			{ 'name': 'progress', 'src': 'default/images/progressbar.png', 'mode': 'repeat-x' },
			{ 'name': 'progress_bar', 'src': 'default/images/progressbar_bar.png', 'mode': 'repeat-x' },
		),
	},
)

ASSETS = {
	"utils": {
		"js": "static://js/utils.js",
	},
	"utils_ajax": {
		"js": "static://js/utils_ajax.js",
	},
}
