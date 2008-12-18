BEGIN TRANSACTION;

INSERT INTO tmp_uservoicemail (
	uniqueid,
	context,
	mailbox,
	password,
	fullname,
	email,
	pager,
	dialout,
	callback,
	exitcontext,
	language,
	tz,
	attach,
	saycid,
	review,
	operator,
	envelope,
	sayduration,
	saydurationm,
	sendvoicemail,
	'delete',
	forcename,
	forcegreetings,
	hidefromdir,
	maxmsg,
	commented)
SELECT
	'',
	CASE WHEN uservoicemail.context = 'local-extensions' THEN 'default' ELSE uservoicemail.context END,
	uservoicemail.mailbox,
	uservoicemail.password,
	uservoicemail.fullname,
	uservoicemail.email,
	uservoicemail.pager,
	uservoicemail.dialout,
	uservoicemail.callback,
	NULL,
	'',
	'eu-fr',
	CASE WHEN uservoicemail.attach = 'yes' THEN 1 ELSE 0 END,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	CASE WHEN uservoicemail.'delete' = 'yes' THEN 1 ELSE 0 END,
	NULL,
	NULL,
	'no',
	NULL,
	uservoicemail.commented
FROM uservoicemail;

COMMIT;