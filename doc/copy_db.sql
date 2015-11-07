-- ┌────────┬───────────────────────────────────────────────┬───────┬─────────┐
-- │ Schema │                     Name                      │ Type  │  Owner  │
-- ├────────┼───────────────────────────────────────────────┼───────┼─────────┤
-- │ public │ [*] account_emailaddress                      │ table │ linuxos │
-- │ public │ [x] account_emailconfirmation                 │ table │ linuxos │
-- │ public │ [x] accounts_remembertoken                    │ table │ linuxos │
-- │ public │ [*] accounts_userrating                       │ table │ linuxos │
-- │ public │ [*] article_article                           │ table │ linuxos │
-- │ public │ [*] article_category                          │ table │ linuxos │
-- │ public │ [*] attachment_attachment                     │ table │ linuxos │
-- │ public │ [x] attachment_attachmentimage                │ table │ linuxos │
-- │ public │ [*] attachment_temporaryattachment            │ table │ linuxos │
-- │ public │ [*] attachment_uploadsession                  │ table │ linuxos │
-- │ public │ [*] auth_group                                │ table │ linuxos │
-- │ public │ [*] auth_group_permissions                    │ table │ linuxos │
-- │ public │ [*] auth_permission                           │ table │ linuxos │
-- │ public │ [*] auth_user                                 │ table │ linuxos │
-- │ public │ [*] auth_user_groups                          │ table │ linuxos │
-- │ public │ [*] auth_user_user_permissions                │ table │ linuxos │
-- │ public │ [*] blog_blog                                 │ table │ linuxos │
-- │ public │ [*] blog_post                                 │ table │ linuxos │
-- │ public │ [*] django_admin_log                          │ table │ linuxos │
-- │ public │ [*] django_comment_flags                      │ table │ linuxos │
-- │ public │ [*] django_comments                           │ table │ linuxos │
-- │ public │ [*] django_content_type                       │ table │ linuxos │
-- │ public │ [x] django_migrations                         │ table │ linuxos │
-- │ public │ [x] django_session                            │ table │ linuxos │
-- │ public │ [*] django_site                               │ table │ linuxos │
-- │ public │ [*] forum_section                             │ table │ linuxos │
-- │ public │ [*] forum_topic                               │ table │ linuxos │
-- │ public │ [ ] hitcount_hitcount                         │ table │ linuxos │
-- │ public │ [ ] news_news                                 │ table │ linuxos │
-- │ public │ [ ] notifications_event                       │ table │ linuxos │
-- │ public │ [ ] notifications_inbox                       │ table │ linuxos │
-- │ public │ [ ] polls_choice                              │ table │ linuxos │
-- │ public │ [ ] polls_poll                                │ table │ linuxos │
-- │ public │ [ ] polls_recordip                            │ table │ linuxos │
-- │ public │ [ ] polls_recorduser                          │ table │ linuxos │
-- │ public │ [ ] reversion_revision                        │ table │ linuxos │
-- │ public │ [ ] reversion_version                         │ table │ linuxos │
-- │ public │ [*] threaded_comments_rootheader              │ table │ linuxos │
-- │ public │ [*] threaded_comments_userdiscussionattribute │ table │ linuxos │
-- │ public │ [ ] wiki_page                                 │ table │ linuxos │
-- └────────┴───────────────────────────────────────────────┴───────┴─────────┘


CREATE EXTENSION dblink;


DELETE FROM auth_permission;
DELETE FROM django_content_type;
DELETE FROM django_site;


-- auth

INSERT INTO django_content_type (id, app_label, model)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, app_label, model FROM django_content_type')
		AS t1(id integer, app_label character varying(100), model character varying(100));

INSERT INTO auth_group(id, name)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, name FROM auth_group')
		AS t1(id integer, name character varying(80));

INSERT INTO auth_permission(id, name, content_type_id, codename)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, name, content_type_id, codename FROM auth_permission')
		AS t1(id integer, name character varying(255), content_type_id integer, codename character varying(100));

INSERT INTO auth_group_permissions(id, group_id, permission_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, group_id, permission_id FROM auth_group_permissions')
		AS t1(id integer, group_id integer, permission_id integer);

INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, jabber, url, signature, display_mail, distribution, original_info, filtered_info, year)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, jabber, url, signature, display_mail, distribution, original_info, filtered_info, year FROM auth_user')
		AS t1(id integer, password character varying(128), last_login timestamp with time zone, is_superuser boolean, username character varying(30), first_name character varying(30), last_name character varying(30), email character varying(254), is_staff boolean, is_active boolean, date_joined timestamp with time zone, jabber character varying(127), url character varying(255), signature character varying(255), display_mail boolean, distribution character varying(50), original_info text, filtered_info text, year smallint);

INSERT INTO auth_user_groups(id, user_id, group_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, user_id, group_id FROM auth_user_groups')
		AS t1(id integer, user_id integer, group_id integer);

INSERT INTO auth_user_user_permissions(id, user_id, permission_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, user_id, permission_id FROM auth_user_user_permissions')
		AS t1(id integer, user_id integer, permission_id integer);


-- django

INSERT INTO django_admin_log(id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id FROM django_admin_log')
		AS t1(id integer, action_time timestamp with time zone, object_id text, object_repr character varying(200), action_flag smallint, change_message text, content_type_id integer, user_id integer);

INSERT INTO django_site(id, domain, name)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, domain, name FROM django_site')
		AS t1(id integer, domain character varying(100), name character varying(50));


-- account

INSERT INTO account_emailaddress(email, verified, "primary", user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT email, true, true, MAX(id) FROM auth_user WHERE is_active = true AND email LIKE ''%@%'' GROUP BY email')
		AS t1(email character varying(254), verified boolean, "primary" boolean, user_id integer);

INSERT INTO account_emailaddress(email, verified, "primary", user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT email, false, true, MAX(id) FROM auth_user WHERE is_active = false AND email LIKE ''%@%'' GROUP BY email')
		AS t1(email character varying(254), verified boolean, "primary" boolean, user_id integer);


-- accounts

INSERT INTO accounts_userrating(id, comments, articles, helped, news, wiki, rating, user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, comments, articles, helped, news, wiki, rating, user_id FROM accounts_userrating')
		AS t1(id integer, comments integer, articles integer, helped integer, news integer, wiki integer, rating integer, user_id integer);


-- attachments

INSERT INTO attachment_attachment(id, attachment, created, size, object_id, content_type_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, attachment, created, size, object_id, content_type_id FROM attachment_attachment')
		AS t1(id integer, attachment character varying(100), created timestamp with time zone, size integer, object_id integer, content_type_id integer);

INSERT INTO attachment_uploadsession(id, created, uuid)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, created, uuid FROM attachment_uploadsession')
		AS t1(id integer, created timestamp with time zone, uuid character varying(32));

INSERT INTO attachment_temporaryattachment(id, attachment, created, size, object_id, content_type_id, session_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, attachment, created, size, object_id, content_type_id, session_id FROM attachment_temporaryattachment')
		AS t1(id integer, attachment character varying(100), created timestamp with time zone, size integer, object_id integer, content_type_id integer, session_id integer);


-- article

INSERT INTO article_category(id, name, slug, description)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, name, slug, description FROM article_category')
		AS t1(id integer, name character varying(255), slug character varying(50), description text);

INSERT INTO article_article(id, title, slug, perex, annotation, content, authors_name, pub_time, updated, published, top, image, author_id, category_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, title, slug, perex, annotation, content, authors_name, pub_time, updated, published, top, image, author_id, category_id FROM article_article')
		AS t1(id integer, title character varying(255), slug character varying(50), perex text, annotation text, content text, authors_name character varying(255), pub_time timestamp with time zone, updated timestamp with time zone, published boolean, top boolean, image character varying(100), author_id integer, category_id integer);


-- blog

INSERT INTO blog_blog(id, title, slug, original_description, filtered_description, original_sidebar, filtered_sidebar, created, updated, author_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, title, slug, original_description, filtered_description, original_sidebar, filtered_sidebar, created, updated, author_id FROM blog_blog')
		AS t1(id integer, title character varying(100), slug character varying(50), original_description text, filtered_description text, original_sidebar text, filtered_sidebar text, created timestamp with time zone, updated timestamp with time zone, author_id integer);

INSERT INTO blog_post(id, title, slug, original_perex, filtered_perex, original_content, filtered_content, pub_time, created, updated, linux, blog_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, title, slug, original_perex, filtered_perex, original_content, filtered_content, pub_time, created, updated, linux, blog_id FROM blog_post')
		AS t1(id integer, title character varying(100), slug character varying(50), original_perex text, filtered_perex text, original_content text, filtered_content text, pub_time timestamp with time zone, created timestamp with time zone, updated timestamp with time zone, linux boolean, blog_id integer);


-- threaded_comments

INSERT INTO django_comments(id, object_id, subject, user_name, original_comment, filtered_comment, submit_date, ip_address, is_public, is_removed, is_locked, updated, lft, rght, tree_id, level, content_type_id, parent_id, user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, object_id, subject, user_name, original_comment, filtered_comment, submit_date, ip_address, is_public, is_removed, is_locked, updated, lft, rght, tree_id, level, content_type_id, parent_id, user_id FROM django_comments')
		AS t1(id integer, object_id text, subject character varying(100), user_name character varying(50), original_comment text, filtered_comment text, submit_date timestamp with time zone, ip_address inet, is_public boolean, is_removed boolean, is_locked boolean, updated timestamp with time zone, lft integer, rght integer, tree_id integer, level integer, content_type_id integer, parent_id integer, user_id integer);

INSERT INTO django_comment_flags(id, flag, flag_date, comment_id, user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, flag, flag_date, comment_id, user_id FROM django_comment_flags')
		AS t1(id integer, flag character varying(30), flag_date timestamp with time zone, comment_id integer, user_id integer);

ALTER TABLE threaded_comments_rootheader ALTER COLUMN last_comment DROP NOT NULL;
INSERT INTO threaded_comments_rootheader(id, pub_date, last_comment, comment_count, is_locked, object_id, content_type_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, pub_date, last_comment, comment_count, is_locked, object_id, content_type_id FROM threaded_comments_rootheader')
		AS t1(id integer, pub_date timestamp with time zone, last_comment timestamp with time zone, comment_count integer, is_locked boolean, object_id integer, content_type_id integer);
UPDATE threaded_comments_rootheader SET last_comment = (SELECT MAX(submit_date) FROM django_comments WHERE cast(django_comments.object_id as integer) = threaded_comments_rootheader.object_id AND django_comments.content_type_id = threaded_comments_rootheader.content_type_id) WHERE last_comment IS NULL;
UPDATE threaded_comments_rootheader SET last_comment = NOW() WHERE last_comment IS NULL;
ALTER TABLE threaded_comments_rootheader ALTER COLUMN last_comment SET NOT NULL;

INSERT INTO threaded_comments_userdiscussionattribute(id, time, watch, discussion_id, user_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, time, watch, discussion_id, user_id FROM threaded_comments_userdiscussionattribute')
		AS t1(id integer, time timestamp with time zone, watch boolean, discussion_id integer, user_id integer);


-- forum

INSERT INTO forum_section(id, name, slug, description)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, name, slug, description FROM forum_section')
		AS t1(id integer, name character varying(255), slug character varying(50), description text);

INSERT INTO forum_topic(id, title, original_text, filtered_text, created, updated, authors_name, is_removed, is_resolved, author_id, section_id)
	SELECT * FROM
		dblink('dbname=linuxos', 'SELECT id, title, original_text, filtered_text, created, updated, authors_name, is_removed, is_resolved, author_id, section_id FROM forum_topic')
		AS t1(id integer, title character varying(100), original_text text, filtered_text text, created timestamp with time zone, updated timestamp with time zone, authors_name character varying(50), is_removed boolean, is_resolved boolean, author_id integer, section_id integer);
