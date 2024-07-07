# Black-Market-Vendor
Adds a Vendor who sells 1 Armor per class and rotates them out weekly


The SQL table is created in your "World" folder. The Lua script for the NPC handles randomly getting the Armor sets and allows players to purchase them for 100 Araxia Tokens.


**EXAMPLE OF an Armor Set Insert**

INSERT INTO araxia_world.black_market_armor_sets (class,item_id,name,item_set_id,set_name) VALUES
	 (11,23294,'Knight-Captain''s Dragonhide Chestpiece',551,'Lieutenant Commander''s Refuge'),
	 (11,23295,'Knight-Captain''s Dragonhide Leggings',551,'Lieutenant Commander''s Refuge'),
	 (11,23280,'Knight-Lieutenant''s Dragonhide Grips',551,'Lieutenant Commander''s Refuge'),
	 (11,23281,'Knight-Lieutenant''s Dragonhide Treads',551,'Lieutenant Commander''s Refuge'),
	 (11,23308,'Lieutenant Commander''s Dragonhide Headguard',551,'Lieutenant Commander''s Refuge'),
	 (11,23309,'Lieutenant Commander''s Dragonhide Shoulders',551,'Lieutenant Commander''s Refuge');
