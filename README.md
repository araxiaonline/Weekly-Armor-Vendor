# Black-Market-Vendor

Adds a Vendor who sells 1 Armor per class and rotates them out weekly.

The SQL table's (`black_market_armor_sets` `black_market_current_set`) is created in your "World" folder. The Lua script for the NPC handles randomly getting the Armor sets and allows players to purchase them for 100 Araxia Tokens (Item ID: 910001).


One table for all the armor sets and one table for the current sets (resets weekly).

##Step 1: Create the SQL TABLES

```sql
CREATE TABLE IF NOT EXISTS `black_market_armor_sets` (
    `class` INT NOT NULL,
    `item_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `item_set_id` INT NOT NULL,
    `set_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`item_id`)
);
```

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

The provided SQL code inserts data into a table named `black_market_armor_sets` in the `acore_world` schema:

```sql
INSERT INTO acore_world.black_market_armor_sets
(class, item_id, name, item_set_id, set_name)
VALUES
(11, 23294, 'Knight-Captain''s Dragonhide Chestpiece', 551, 'Lieutenant Commander''s Refuge');
``` 

`INSERT INTO acore_world.black_market_armor_sets`: Specifies the table where data will be inserted.

`(class, item_id, name, item_set_id, set_name)`: Specifies the columns into which data will be inserted:

`class:` Class identifier for the armor set. (1 - Warrior, 2 - Paladin, 3 - Hunter, 4 - Rogue, 5 - Priest, 6 - Death Knight, 7 - Shaman, 9 - Mage,  9 - Warlock, 11 - Druid)<br>
<br>
`item_id:` Unique identifier for the armor item.  (The Items listed in the "Armor Set")<br>
`name:` Name of the armor item.<br>
`item_set_id:` Identifier for the armor set. (Each armor set has its own unique number, 551, 250, 689, etc.)<br>
`set_name:` Name of the armor set.<br>
`VALUES:` Indicates that the subsequent values correspond to the columns listed above.
