BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "client" (
	"id"	INTEGER,
	"client_name"	TEXT,
	"tel"	TEXT,
	"address"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "client" ("id","client_name","tel","address") VALUES (1,'佐藤','111-1111-1111','栃木県鹿沼市111');
INSERT INTO "client" ("id","client_name","tel","address") VALUES (2,'高橋','222-2222-2222','栃木県鹿沼市222');
INSERT INTO "client" ("id","client_name","tel","address") VALUES (3,'田中','333-3333-3333','栃木県鹿沼市333');
INSERT INTO "client" ("id","client_name","tel","address") VALUES (4,'伊藤','444-4444-4444','栃木県鹿沼市444');
COMMIT;
