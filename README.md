# Black-Market-Vendor

Adds a Vendor who sells 1 Armor per class and rotates them out weekly.

The SQL table is created in your "World" folder. The Lua script for the NPC handles randomly getting the Armor sets and allows players to purchase them for 100 Araxia Tokens.

**EXAMPLE OF an Armor Set Insert**

```sql
INSERT INTO araxia_world.black_market_armor_sets (class, item_id, name, item_set_id, set_name) VALUES
    (11, 23294, 'Knight-Captain''s Dragonhide Chestpiece', 551, 'Lieutenant Commander''s Refuge'),
    (11, 23295, 'Knight-Captain''s Dragonhide Leggings', 551, 'Lieutenant Commander''s Refuge'),
    (11, 23280, 'Knight-Lieutenant''s Dragonhide Grips', 551, 'Lieutenant Commander''s Refuge'),
    (11, 23281, 'Knight-Lieutenant''s Dragonhide Treads', 551, 'Lieutenant Commander''s Refuge'),
    (11, 23308, 'Lieutenant Commander''s Dragonhide Headguard', 551, 'Lieutenant Commander''s Refuge'),
    (11, 23309, 'Lieutenant Commander''s Dragonhide Shoulders', 551, 'Lieutenant Commander''s Refuge');
``` 


### Explanation of SQL Code

The provided SQL code inserts data into a table named `black_market_armor_sets` in the `araxia_world` schema:

```sql
INSERT INTO araxia_world.black_market_armor_sets
(class, item_id, name, item_set_id, set_name)
VALUES
(11, 23294, 'Knight-Captain''s Dragonhide Chestpiece', 551, 'Lieutenant Commander''s Refuge');
``` 

`INSERT INTO araxia_world.black_market_armor_sets`: Specifies the table where data will be inserted.

`(class, item_id, name, item_set_id, set_name)`: Specifies the columns into which data will be inserted:

class: Class identifier for the armor set.
item_id: Unique identifier for the armor item.
name: Name of the armor item.
item_set_id: Identifier for the armor set.
set_name: Name of the armor set.
VALUES: Indicates that the subsequent values correspond to the columns listed above.


### Explanation of SQL Code

The provided SQL code inserts data into a table named `black_market_armor_sets` in the `araxia_world` schema:

```sql
INSERT INTO araxia_world.black_market_armor_sets
(class, item_id, name, item_set_id, set_name)
VALUES
(11, 23294, 'Knight-Captain''s Dragonhide Chestpiece', 551, 'Lieutenant Commander''s Refuge');
```
INSERT INTO araxia_world.black_market_armor_sets: Specifies the table where data will be inserted.

(class, item_id, name, item_set_id, set_name): Specifies the columns into which data will be inserted:

class: Class identifier for the armor set.
item_id: Unique identifier for the armor item.
name: Name of the armor item.
item_set_id: Identifier for the armor set.
set_name: Name of the armor set.
VALUES: Indicates that the subsequent values correspond to the columns listed above.

Each set of values in parentheses represents a row of data that will be inserted into the table. For example:


```sql(11, 23294, 'Knight-Captain''s Dragonhide Chestpiece', 551, 'Lieutenant Commander''s Refuge')
```
Inserts data where:

class is 11
item_id is 23294
name is 'Knight-Captain''s Dragonhide Chestpiece'
item_set_id is 551
set_name is 'Lieutenant Commander''s Refuge'
This SQL statement adds multiple rows of armor set data to the black_market_armor_sets table, each representing a different piece of armor within the same set intended for a specific class.
