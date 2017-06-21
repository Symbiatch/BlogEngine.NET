CREATE TABLE be_Blogs (
  BlogRowId serial,
  BlogId uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  BlogName text NOT NULL DEFAULT '',
  Hostname text NOT NULL DEFAULT '',
  IsAnyTextBeforeHostnameAccepted boolean NOT NULL DEFAULT true,
  StorageContainerName text NOT NULL DEFAULT '',
  VirtualPath text NOT NULL DEFAULT '',
  IsPrimary boolean NOT NULL DEFAULT false,
  IsActive boolean NOT NULL DEFAULT true,
  IsSiteAggregation boolean NOT NULL DEFAULT false,
  PRIMARY KEY (BlogRowId)
);

CREATE TABLE be_Categories (
  CategoryRowID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  CategoryID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  CategoryName text DEFAULT NULL,
  Description text DEFAULT NULL,
  ParentID uuid DEFAULT NULL,
  PRIMARY KEY (CategoryRowID)
);

CREATE TABLE be_DataStoreSettings (
  DataStoreSettingRowId serial,
  BlogId uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  ExtensionType text NOT NULL,
  ExtensionId text NOT NULL,
  Settings text NOT NULL,
  PRIMARY KEY (DataStoreSettingRowId)
);

CREATE TABLE be_Pages (
  PageRowID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PageID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  Title text NOT NULL DEFAULT '',
  Description text,
  PageContent text,
  Keywords text,
  DateCreated timestamp DEFAULT NULL,
  DateModified timestamp DEFAULT NULL,
  IsPublished boolean DEFAULT NULL,
  IsFrontPage boolean DEFAULT NULL,
  Parent uuid DEFAULT '00000000-0000-0000-0000-000000000000',
  ShowInList boolean DEFAULT NULL,
  Slug text DEFAULT NULL,
  IsDeleted boolean NOT NULL DEFAULT false,
  PRIMARY KEY (PageRowID)
);

CREATE TABLE be_PingService (
  PingServiceID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  Link text DEFAULT NULL,
  PRIMARY KEY (PingServiceID)
);

CREATE TABLE be_Posts (
  PostRowID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PostID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  Title text NOT NULL DEFAULT '',
  Description text NOT NULL,
  PostContent text NOT NULL,
  DateCreated timestamp NOT NULL DEFAULT '1970-01-01 00:00:00',
  DateModified timestamp NOT NULL DEFAULT '1970-01-01 00:00:00',
  Author text NOT NULL DEFAULT '',
  IsPublished boolean NOT NULL DEFAULT false,
  IsCommentEnabled boolean NOT NULL DEFAULT false,
  Raters int NOT NULL DEFAULT 0,
  Rating real NOT NULL DEFAULT 0,
  Slug text NOT NULL DEFAULT '',
  IsDeleted boolean NOT NULL DEFAULT false,
  PRIMARY KEY (PostRowID)
);

CREATE TABLE be_Profiles (
  ProfileID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  UserName text NOT NULL,
  SettingName text NOT NULL,
  SettingValue text NOT NULL,
  PRIMARY KEY (ProfileID)
);

CREATE TABLE be_Roles (
  RoleID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  Role text NOT NULL,
  PRIMARY KEY (RoleID)
);

CREATE TABLE be_Settings (
  SettingRowId serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  SettingName text NOT NULL,
  SettingValue text,
  PRIMARY KEY (SettingRowId)
);

CREATE TABLE be_StopWords (
  StopWordRowId serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  StopWord text NOT NULL,
  PRIMARY KEY (StopWordRowId)
);

CREATE TABLE be_Users (
  UserID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  UserName text DEFAULT NULL,
  Password text DEFAULT NULL,
  LastLoginTime timestamp DEFAULT '1970-01-01 00:00:00',
  EmailAddress text DEFAULT NULL,
  PRIMARY KEY (UserID)
);

CREATE TABLE be_UserRoles (
  UserRoleID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  UserName text NOT NULL DEFAULT '',
  Role text NOT NULL DEFAULT '',
  PRIMARY KEY (UserRoleID)
);

CREATE TABLE be_PostCategory (
  PostCategoryID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PostID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  CategoryID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PRIMARY KEY (PostCategoryID)
);

CREATE TABLE be_PostComment (
  PostCommentRowID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PostCommentID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PostID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  ParentCommentID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  CommentDate timestamp NOT NULL DEFAULT '1970-01-01 00:00:00',
  Author text NOT NULL DEFAULT '',
  Email text NOT NULL DEFAULT '',
  Website text NOT NULL DEFAULT '',
  Comment text NOT NULL,
  Country text NOT NULL DEFAULT '',
  Ip text NOT NULL DEFAULT '',
  IsApproved boolean NOT NULL DEFAULT false,
  ModeratedBy text DEFAULT NULL,
  Avatar text DEFAULT NULL,
  IsSpam boolean NOT NULL DEFAULT false,
  IsDeleted boolean NOT NULL DEFAULT false,
  PRIMARY KEY (PostCommentRowID)
);

CREATE TABLE be_PostNotify (
  PostNotifyID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PostID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  NotifyAddress text DEFAULT NULL,
  PRIMARY KEY (PostNotifyID)
);

CREATE TABLE be_PostTag (
  PostTagID serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PostID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  Tag text DEFAULT NULL,
  PRIMARY KEY (PostTagID)
);

CREATE TABLE IF NOT EXISTS be_BlogRollItems (
  BlogRollRowId serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  BlogRollId uuid NOT NULL,
  Title text NOT NULL,
  Description text DEFAULT NULL,
  BlogUrl text NOT NULL,
  FeedUrl text DEFAULT NULL,
  Xfn text DEFAULT NULL,
  SortIndex int NOT NULL,
  PRIMARY KEY (BlogRollRowId)
);

CREATE TABLE IF NOT EXISTS be_Referrers (
  ReferrerRowId serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  ReferrerId uuid NOT NULL,
  ReferralDay timestamp NOT NULL,
  ReferrerUrl text NOT NULL,
  ReferralCount int NOT NULL,
  Url text DEFAULT NULL,
  IsSpam boolean NULL,
  PRIMARY KEY (ReferrerRowId)
);

CREATE TABLE IF NOT EXISTS be_Rights (
  RightRowId serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  RightName text NOT NULL,
  PRIMARY KEY (RightRowId)
);

CREATE TABLE IF NOT EXISTS be_RightRoles (
  RightRoleRowId serial,
  BlogID uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  RightName text NOT NULL,
  Role text NOT NULL,
  PRIMARY KEY (RightRoleRowId)
);

CREATE TABLE be_Packages (
  PackageId text NOT NULL,
  Version text NOT NULL,
  PRIMARY KEY (PackageId)
);

CREATE TABLE be_PackageFiles (
  PackageId text NOT NULL,
  FileOrder int NOT NULL,
  FilePath text NOT NULL,
  IsDirectory boolean NOT NULL,
  PRIMARY KEY (PackageId, FileOrder)
);

CREATE TABLE be_QuickNotes (
  QuickNoteID serial,
  NoteID uuid NOT NULL,
  BlogID uuid NOT NULL,
  UserName text NOT NULL,
  Note text NOT NULL,
  Updated timestamp NOT NULL,
  PRIMARY KEY (QuickNoteID)
);

CREATE TABLE be_QuickSettings (
  QuickSettingID serial,
  BlogID uuid NOT NULL,
  UserName text NOT NULL,
  SettingName text NOT NULL,
  SettingValue text NOT NULL,
  PRIMARY KEY (QuickSettingID)
);

CREATE TABLE be_FileStoreDirectory (
  Id uuid NOT NULL,
  ParentID uuid NOT NULL,
  BlogID uuid NOT NULL,
  Name text NOT NULL,
  FullPath text NOT NULL,
  CreateDate timestamp NOT NULL,
  LastAccess timestamp NOT NULL,
  LastModify timestamp NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE be_FileStoreFiles (
  FileID uuid NOT NULL,
  ParentDirectoryID uuid NOT NULL,
  Name text NOT NULL,
  FullPath text NOT NULL,
  Contents bytea NOT NULL,
  Size int NOT NULL,
  CreateDate timestamp NOT NULL,
  LastAccess timestamp NOT NULL,
  LastModify timestamp NOT NULL,
  PRIMARY KEY (FileID)
);

CREATE TABLE be_FileStoreFileThumbs (
  thumbnailId text NOT NULL,
  FileId uuid NOT NULL,
  Size int NOT NULL,
  Contents bytea NOT NULL,
  PRIMARY KEY (thumbnailId)
);

CREATE TABLE be_CustomFields (
  CustomType text NOT NULL,
  ObjectId text NOT NULL,
  BlogId uuid NOT NULL,
  Key text NOT NULL,
  Value text NOT NULL,
  Attribute text NULL,
  CONSTRAINT be_customfields_pkey PRIMARY KEY (customtype, objectid, blogid, key)
);

/***  Load initial Data ***/

INSERT INTO be_Blogs (BlogId, BlogName, Hostname, IsAnyTextBeforeHostnameAccepted, StorageContainerName, VirtualPath, IsPrimary, IsActive) VALUES ('27604f05-86ad-47ef-9e05-950bb762570c', 'Primary', '', false, '', '~/', true, true);

INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'administratorrole', 'Administrators');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'alternatefeedurl', '');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'authorname', 'My name');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'avatar', 'combine');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'blogrollmaxlength', '23');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'blogrollupdateminutes', '60');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'blogrollvisibleposts', '3');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'contactformmessage', '<p>I will answer the mail as soon as I can.</p>');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'contactthankmessage', '<h1>Thank you</h1><p>The message was sent.</p>');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'culture', 'Auto');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'dayscommentsareenabled', '0');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'description', 'Short description of the blog');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'displaycommentsonrecentposts', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'displayratingsonrecentposts', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'email', 'user@example.com');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'emailsubjectprefix', 'Weblog');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablecommentsearch', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablecommentsmoderation', 'False');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablecontactattachments', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablecountryincomments', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablehttpcompression', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enableopensearch', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablepingbackreceive', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablepingbacksend', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablerating', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablereferrertracking', 'False');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablerelatedposts', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablessl', 'False');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enabletrackbackreceive', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enabletrackbacksend', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'endorsement', 'http://www.dotnetblogengine.net/syndication.axd');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'fileextension', '.aspx');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'geocodinglatitude', '0');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'geocodinglongitude', '0');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'handlewwwsubdomain', '');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'iscocommentenabled', 'False');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'iscommentsenabled', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'language', 'en-GB');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'mobiletheme', 'Standard');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'name', 'Name of the blog');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'numberofrecentcomments', '10');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'numberofrecentposts', '10');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'postsperfeed', '10');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'postsperpage', '10');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'removewhitespaceinstylesheets', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'searchbuttontext', 'Search');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'searchcommentlabeltext', 'Include comments in search');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'searchdefaulttext', 'Enter search term');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'sendmailoncomment', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'showdescriptioninpostlist', 'False');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'showlivepreview', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'showpostnavigation', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'smtppassword', 'password');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'smtpserver', 'mail.example.dk');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'smtpserverport', '25');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'smtpusername', 'user@example.com');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'storagelocation', '~/App_Data/');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'syndicationformat', 'Rss');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'theme', 'Standard');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'timestamppostlinks', 'True');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'timezone', '0');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'trackingscript', '');
INSERT INTO be_Settings (BlogID, SettingName, SettingValue)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'enablequicknotes', 'True');

INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://rpc.technorati.com/rpc/ping');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://rpc.pingomatic.com/rpc2');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://ping.feedburner.com');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://www.bloglines.com/ping');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://services.newsgator.com/ngws/xmlrpcping.aspx');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://api.my.yahoo.com/rpc2 ');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://blogsearch.google.com/ping/RPC2');
INSERT INTO be_PingService (BlogID, Link) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'http://rpc.pingthesemanticweb.com/');

INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'a');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'about');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'actually');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'add');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'after');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'all');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'almost');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'along');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'also');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'an');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'and');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'any');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'are');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'as');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'at');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'be');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'both');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'but');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'by');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'can');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'cannot');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'com');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'could');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'de');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'do');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'down');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'each');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'either');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'en');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'for');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'from');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'good');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'has');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'have');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'he');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'her');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'here');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'hers');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'his');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'how');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'i');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'if');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'in');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'into');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'is');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'it');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'its');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'just');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'la');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'like');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'long');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'make');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'me');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'more');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'much');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'my');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'need');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'new');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'now');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'of');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'off');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'on');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'once');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'one');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'ones');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'only');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'or');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'our');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'out');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'over');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'own');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'really');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'right');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'same');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'see');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'she');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'so');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'some');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'such');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'take');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'takes');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'that');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'the');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'their');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'these');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'thing');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'this');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'to');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'too');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'took');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'und');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'up');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'use');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'used');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'using');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'very');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'was');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'we');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'well');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'what');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'when');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'where');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'who');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'will');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'with');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'www');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'you');
INSERT INTO be_StopWords (BlogId, StopWord)	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'your');

INSERT INTO be_BlogRollItems ( BlogId, BlogRollId, Title, Description, BlogUrl, FeedUrl, Xfn, SortIndex )
VALUES ( '27604F05-86AD-47EF-9E05-950BB762570C', '25e4d8da-3278-4e58-b0bf-932496dabc96', 'Mads Kristensen', 'Full featured simplicity in ASP.NET and C#', 'http://madskristensen.net', 'http://feeds.feedburner.com/netslave', 'contact', 0 );
INSERT INTO be_BlogRollItems ( BlogId, BlogRollId, Title, Description, BlogUrl, FeedUrl, Xfn, SortIndex )
VALUES ( '27604F05-86AD-47EF-9E05-950BB762570C', 'ccc817ef-e760-482b-b82f-a6854663110f', 'Al Nyveldt', 'Adventures in Code and Other Stories', 'http://www.nyveldt.com/blog/', 'http://feeds.feedburner.com/razorant', 'contact', 1 );
INSERT INTO be_BlogRollItems ( BlogId, BlogRollId, Title, Description, BlogUrl, FeedUrl, Xfn, SortIndex )
VALUES ( '27604F05-86AD-47EF-9E05-950BB762570C', 'dcdaa78b-0b77-4691-99f0-1bb6418945a1', 'Ruslan Tur', '.NET and Open Source: better together', 'http://rtur.net/blog/', 'http://feeds.feedburner.com/rtur', 'contact', 2 );
INSERT INTO be_BlogRollItems ( BlogId, BlogRollId, Title, Description, BlogUrl, FeedUrl, Xfn, SortIndex )
VALUES ( '27604F05-86AD-47EF-9E05-950BB762570C', '8a846489-b69e-4fde-b2b2-53bc6104a6fa', 'John Dyer', 'Technology and web development in ASP.NET, Flash, and JavaScript', 'http://johndyer.name/', 'http://johndyer.name/syndication.axd', 'contact', 3 );
INSERT INTO be_BlogRollItems ( BlogId, BlogRollId, Title, Description, BlogUrl, FeedUrl, Xfn, SortIndex )
VALUES ( '27604F05-86AD-47EF-9E05-950BB762570C', '7f906880-4316-47f1-a934-1a912fc02f8b', 'Russell van der Walt', 'an adventure in web technologies', 'http://blog.ruski.co.za/', 'http://feeds.feedburner.com/rusvdw', 'contact', 4 );
INSERT INTO be_BlogRollItems ( BlogId, BlogRollId, Title, Description, BlogUrl, FeedUrl, Xfn, SortIndex )
VALUES ( '27604F05-86AD-47EF-9E05-950BB762570C', '890f00e5-3a86-4cba-b85b-104063964a87', 'Ben Amada', 'adventures in application development', 'http://allben.net/', 'http://feeds.feedburner.com/allben', 'contact', 5 );

INSERT INTO be_Categories (BlogID, CategoryID, CategoryName)
	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'ffc26b8b-7d45-46e3-b702-7198e8847e06', 'General');

INSERT INTO be_Posts (BlogID, PostID, Title, Description, PostContent, DateCreated, DateModified, Author, IsPublished)
	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'daf4bc0e-f4b7-4895-94b2-3b1413379d4b', 
	'Welcome to BlogEngine.NET 3.1 using PostgreSQL', 
	'The description is used as the meta description as well as shown in the related posts. It is recommended that you write a description, but not mandatory',
	'<p>If you see this post it means that BlogEngine.NET is running and the hard part of creating your own blog is done. There is only a few things left to do.</p>
<h2>Write Permissions</h2>
<p>To be able to log in, write posts and customize blog, you need to enable write permissions on the App_Data and Custom folders. If your blog is hosted at a hosting provider, you can either log into your account’s admin page or call the support.<br></p>
<p>If you wish to use a database to store your blog data, we still encourage you to enable this write access for an images you may wish to store for your blog posts.&nbsp; If you are interested in using Microsoft SQL Server, PostgreSQL, SQL CE, or other databases, please see the <a href="http://dnbe.net/docs">BlogEngine docs</a> to get started.</p>
<h2>Security</h2>
<p>When youve got write permissions set, you need to change the username and password. Find the sign-in link located either at the bottom or top of the page depending on your current theme and click it. Now enter Admin in both the username and password fields and click the button. You will now see an admin menu appear. It has a link to the Users admin page. From there you can change password, create new users and set roles and permissions. Passwords are hashed by default so you better configure email in settings for password recovery to work or <a target="_blank" href="http://dnbe.net/docs/post/frequently-asked-questions#HowdoIresetlostadminpassword">learn how to do it manually</a>.<br></p>
<h2>Configuration and Profile</h2>
<p>Now that you have your blog secured, take a look through the settings and give your new blog a title.&nbsp; BlogEngine.NET is set up to take full advantage of many semantic formats and technologies such as FOAF, SIOC and APML. It means that the content stored in your BlogEngine.NET installation will be fully portable and auto-discoverable.&nbsp; Be sure to fill in your author profile to take better advantage of this.</p>
<h2>Themes, Widgets &amp; Extensions</h2>
<p>One last thing to consider is customizing the look and behavior of your blog. We have themes, widgets and extensions available right out of the box. You can install more right from admin panel under Custom/Gallery.</p>
<h2>On the web</h2>
<p>You can find news about BlogEngine.NET on the <a href=http://www.dotnetblogengine.net>official website</a>. For tutorials, documentation, tips and tricks visit our <a target="_blank" href="http://dnbe.net/docs">docs site</a>. The ongoing development of BlogEngine.NET can be followed at <a href="http://blogengine.codeplex.com/">CodePlex</a> where the daily builds will be published for anyone to download.<br></p>
<p>Good luck and happy writing.</p>
<p>The BlogEngine.NET team</p>',
	now(), 
	now(),
	'admin',
	true);

INSERT INTO be_PostCategory (BlogID, PostID, CategoryID)
	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'daf4bc0e-f4b7-4895-94b2-3b1413379d4b', 'ffc26b8b-7d45-46e3-b702-7198e8847e06');
INSERT INTO be_PostTag (BlogID, PostID, Tag)
	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'daf4bc0e-f4b7-4895-94b2-3b1413379d4b', 'blog');
INSERT INTO be_PostTag (BlogID, PostID, Tag)
	VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'daf4bc0e-f4b7-4895-94b2-3b1413379d4b', 'welcome');
	
INSERT INTO be_Users (BlogID, UserName, Password, LastLoginTime, EmailAddress) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'Admin', '', now(), 'email@example.com');
INSERT INTO be_Roles (BlogID, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'Administrators');
INSERT INTO be_Roles (BlogID, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'Editors');
INSERT INTO be_UserRoles (BlogID, UserName, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'Admin', 'Administrators');

INSERT INTO be_DataStoreSettings (BlogId, ExtensionType, ExtensionId, Settings)
VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 1, 'be_WIDGET_ZONE', '<?xml version="1.0" encoding="utf-16"?><WidgetData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Settings>&lt;widgets&gt;&lt;widget id="d9ada63d-3462-4c72-908e-9d35f0acce40" title="TextBox" showTitle="True"&gt;TextBox&lt;/widget&gt;&lt;widget id="19baa5f6-49d4-4828-8f7f-018535c35f94" title="Administration" showTitle="True"&gt;Administration&lt;/widget&gt;&lt;widget id="d81c5ae3-e57e-4374-a539-5cdee45e639f" title="Search" showTitle="True"&gt;Search&lt;/widget&gt;&lt;widget id="77142800-6dff-4016-99ca-69b5c5ebac93" title="Tag Cloud" showTitle="True"&gt;TagCloud&lt;/widget&gt;&lt;widget id="4ce68ae7-c0c8-4bf8-b50f-a67b582b0d2e" title="Post List" showTitle="True"&gt;PostList&lt;/widget&gt;&lt;/widgets&gt;</Settings></WidgetData>');

--
-- be_Pages SortOrder
--
ALTER TABLE be_Pages ADD COLUMN SortOrder INT DEFAULT 0;
--
-- add new rights to administrators
--
INSERT INTO be_RightRoles (BlogID, RightName, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'ViewDashboard', 'Administrators');
INSERT INTO be_RightRoles (BlogID, RightName, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'ManageExtensions', 'Administrators');
INSERT INTO be_RightRoles (BlogID, RightName, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'ManageThemes', 'Administrators');
INSERT INTO be_RightRoles (BlogID, RightName, Role) VALUES ('27604F05-86AD-47EF-9E05-950BB762570C', 'ManagePackages', 'Administrators');

INSERT INTO be_Rights (BlogId, RightName) VALUES ('27604f05-86ad-47ef-9e05-950bb762570c', 'ViewDashboard');
INSERT INTO be_Rights (BlogId, RightName) VALUES ('27604f05-86ad-47ef-9e05-950bb762570c', 'ManageExtensions');
INSERT INTO be_Rights (BlogId, RightName) VALUES ('27604f05-86ad-47ef-9e05-950bb762570c', 'ManageThemes');
INSERT INTO be_Rights (BlogId, RightName) VALUES ('27604f05-86ad-47ef-9e05-950bb762570c', 'ManagePackages');

grant all on all tables in schema public to "beUser";
grant all on all sequences in schema public to "beUser";

create unique index be_posts_blogpostid on be_posts (blogid, postid);
create index be_posts_blogid on be_posts (blogid);
create index be_categories_blogid on be_categories (blogid);
create index be_postcomment_blogpostid on be_postcomment (blogid, postid);
