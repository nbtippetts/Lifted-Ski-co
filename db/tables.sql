-- Admin can add/update/remove product on site.
-- Admin can add/update/remove product in admin cart.
-- Admin can add/update/remove customer profile.
-- Admin can add/update/remove product in customer cart.
-- Admin can add/update/remove customer order.
-- Admin can access payment_ID info.
CREATE TABLE admin (
  admin_ID                 INTEGER PRIMARY KEY NOT NULL,
  admin_name               VARCHAR(50) NOT NULL,
  admin_password           VARCHAR(20) NOT NULL,
  payment_ID               INTEGER REFERENCES payment NOT NULL,
  customer_ID              INTEGER REFERENCES customers NOT NULL,
  product_ID               INTEGER REFERENCES products NOT NULL,
  order_ID 			           INTEGER REFERENCES order_checkout NOT NULL,
  cart_ID                  INTEGER REFERENCES cart NOT NULL,
  confirmation_ID          INTEGER REFERENCES order_confirmation NOT NULL
);

CREATE TABLE products (
  product_ID               SERIAL PRIMARY KEY NOT NULL,
  product_name             VARCHAR(100) NOT NULL,
  product_description      VARCHAR(250) NOT NULL,
  product_details          VARCHAR(250) NOT NULL,
  product_specs            VARCHAR(250) NOT NULL,
  product_image_URL        VARCHAR(300),
  product_price            VARCHAR(20) NOT NULL
);

-- Customer can create account through Facebook.
-- Customer can add/update/remove personal account.
-- Customer can add/update/remove product from cart.
-- Customer can add/update/remove product from order checkout.
CREATE TABLE customers (
  customer_ID 		         SERIAL PRIMARY KEY NOT NULL,
  customer_first_name 	   VARCHAR(40) NOT NULL,
  customer_last_name	     VARCHAR(40) NOT NULL,
  customer_password	       VARCHAR(40) NOT NULL,
  customer_facebook        VARCHAR(40),
  customer_email		       VARCHAR(80) NOT NULL,
  customer_phone		       VARCHAR(20),
  customer_address		     VARCHAR(80) NOT NULL,
  customer_city		         VARCHAR(40)  NOT NULL,
  customer_state		       VARCHAR(40) NOT NULL,
  customer_zip		         VARCHAR(12) NOT NULL,
  customer_country 		     VARCHAR(40) NOT NULL,
  customer_register_date   TIMESTAMP
);

-- Customer can choose to pay with paypal, apple pay, etc...
-- Customer can add/update/remove credit card info.
CREATE TABLE payment (
  payment_ID               SERIAL PRIMARY KEY NOT NULL,
  paypal                   VARCHAR(40) NOT NULL,
  card_name                VARCHAR(40) NOT NULL,
  card_number              VARCHAR(40) NOT NULL,
  card_expiration          VARCHAR(40) NOT NULL,
  card_security            VARCHAR(40) NOT NULL,
  customer_ID              INTEGER REFERENCES customers NOT NULL
);

-- Cart will grab the customer_ID.
-- Cart will grab product_ID and info to display.
-- Customer can change cart quantity of product.
CREATE TABLE cart (
  cart_ID                  SERIAL PRIMARY KEY NOT NULL,
  cart_product_quantity    INTEGER NOT NULL,
  cart_product_price       VARCHAR(40) NOT NULL,
  cart_total_price         VARCHAR(40) NOT NULL,
  customer_ID              INTEGER REFERENCES customers NOT NULL,
  product_ID               INTEGER REFERENCES products NOT NULL
);

-- Order will grab customer_ID, cart_ID, product_ID and display necessary info.
-- Customer will be able to select their customer_ID info as billing/shipping info.
-- Customer can choose to put in different billing/shipping info and saves as 'order_"info"'.
-- Customer can choose saved payment method.
CREATE TABLE orders (
  order_ID 		                   SERIAL PRIMARY KEY NOT NULL,
  order_first_name 	             VARCHAR(40) NOT NULL,
  order_last_name	               VARCHAR(40) NOT NULL,
  order_email		                 VARCHAR(80) NOT NULL,
  order_phone		                 VARCHAR(20),
  order_address		               VARCHAR(80) NOT NULL,
  order_city		                 VARCHAR(40)  NOT NULL,
  order_state		                 VARCHAR(40) NOT NULL,
  order_zip		                   VARCHAR(12) NOT NULL,
  order_country		               VARCHAR(40) NOT NULL,
  customer_ID                    INTEGER REFERENCES customers NOT NULL,
  product_ID                     INTEGER REFERENCES products NOT NULL,
  cart_ID                        INTEGER REFERENCES cart NOT NULL
);

CREATE TABLE order_confirmation (
  confirmation_ID                SERIAL PRIMARY KEY NOT NULL,
  order_ID 		                   INTEGER REFERENCES order_checkout NOT NULL,
  customer_ID                    INTEGER REFERENCES customers NOT NULL,
  product_ID                     INTEGER REFERENCES products NOT NULL
);

CREATE TABLE teams (
  ID SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  age INTEGER,
  homemountain TEXT,
  profileimg TEXT,
  bio TEXT
);
-- product_name, product_description, product_price, product_image_url
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('MAGNUM OPUS BY ERIC POLLARD', 950.00, 'ERIC POLLARD\\S GREATEST CREATION', 'The Magnum Opus rises above all powder skis with award-winning, intuitive edge-to-edge precision and impossibly lightweight performance brought to you by LINE pro Eric Pollard. The Opus is playful yet stable, with all-new bamboo sidewalls this season which add greater durability and dampness to your ride. With Pollard’s hunger for more funner skiing and 15 years of industry-leading powder ski innovation to back it up, the LINE Magnum Opus just keeps on singing.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_magnum-opus_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 124,
--     Length cm: 188 cm,
--     Shape mm: 147-124-146,
--     Sidecut m: 17 (188 cm),
--     Stance mm: -20 Erics Choice,
--     Weight: 2100g/ski (188),
--     Profile mm: 12-4-12,
--     (Tip Early Rise-Camber-Tail Early Rise)');
--  INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--    VALUES ('PESCADO BY ERIC POLLARD', 1050.00, 'SURF THE SNOW AND PLAY ON EVERYTHING', '/pesk.’ka.do/ – A fish that’s been caught. LINE athlete Eric Pollard has been tracking the Pescado for years, and he’s finally ready to dish it out this season. A directional, surfy ski with bamboo sidewalls, Partly Cloudy Core™, and a veneer topsheet with a timeless graphic, the LINE Pescado fuses the best of surfing, art, and skiing with an innovative fish shape and swallow tail that’ll carve deeper and float faster.
--     “The Pescado, much like the Magnum Opus, is the culmination of years of hard work with LINE and myself.” – Eric Pollard', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_pescado_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 125
--     Length cm: 180,
--     Shape mm: 158-125-147,
--     Sidecut m: 19 (180 cm),
--     Stance mm: -80,
--     Weight: Weight: 1950 g/ski (180),
--     Profile mm: 20-4-1,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('MORDECAI BY ERIC POLLARD', 950.00, 'EP\\S EVERYTHING SKI', 'The Mordecai – meaning, “warrior,” of course – is LINE pro Eric Pollard’s wider all terrain ski that’s prepared to slash, butter, and smear any and every feature the mountain lays before you. This is the predecessor of Mr. Pollard’s award-winning Opus ski. Nimble and playful through pow and crud alike, with an excellent weight-to-strength ratio, the LINE Mordecai’s Symmetric Flex™ and lightweight Partly Cloudy Core™ platform is your tool for all manners of all-mountain mayhem.
--     “The Mordecai is an extension of my drive for a better ski.” – Eric Pollard', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_mordecai_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 114
--     Length cm: 179, 186, 193,
--     Shape mm: 141-114-138,
--     Sidecut m: 17 (186cm),
--     Stance mm: Erics Choice -20 / Recommended -60,
--     Weight: Weight: 2,029 g/ski (186),
--     Profile mm: 15-5-15,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('SIR FRANCIS BACON BY ERIC POLLARD', 850.00, 'BACON IS ALWAYS A GOOD idea', 'The new Sir Francis Bacon is a refined, everyday ski that delivers an even better all-mountain ride – the kind of ride that made this ski famous in the first place. Sir Bacon was a scientific revolutionary, and this award-winning ski is LINE athlete Eric Pollard’s contribution to the movement – a narrower waist for a lighter, speedier ride, with five radii blended into the overall sidecut for intuitive control. As Eric describes it, The Sir Francis Bacon floats through milky snow, carves the hardpack, and has a buttery personality.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_sir-francis-bacon_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 104
--     Length cm: 178, 184, 190,
--     Shape mm: 135-104-131,
--     Sidecut m: 17.4 (184cm),
--     Stance mm: Erics Choice -20 / Recommended -60,
--     Weight: Weight: 2,045 g/ski (186),
--     Profile mm: 9-3-9,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('TOM WALLISCH PRO', 550.00, 'THE BEST DEMANDS THE BEST', 'This is LINE pro Tom Wallisch’s ski. It goes wherever Tom goes. On trails, on rails, off jumps, through bumps, on wall rides and long car rides, on airplanes, on chairlifts, on podiums, on quad kinks… you get the picture. Tom packed these skis with slight Early Rise™ and Early Taper ™ that work together to create catch free spins and an ultra-light swing weight. Our revamped Carbon Ollieband™ is the real kicker, packing more ollie power than anything previously imagined. Brand-new this year, you finally have the opportunity to ride like Tom – if you want to go where Tom goes, you’ve gotta be riding the new LINE Tom Wallisch Pro Ski.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_tom-wallisch-pro_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 90
--     Length cm: 164, 171, 178,
--     Shape mm: 117-90-112,
--     Sidecut m: 20.8 (178 cm),
--     Stance mm: -30,
--     Weight: 1802 g/ski (178 cm),
--     Profile mm: 1-6-1,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--  VALUES ('BLEND', 750.00, 'A BLEND OF FREESTYLE FUN', 'The LINE Blend is a freestyle ski with not an ounce of emotional baggage. A wide platform and a forgiving flex make this ski a buttery toy that helps you press, jump, spin, and just get more creative with your skiing. LINE pro Will Wesson uses the Blend as his go-everywhere and do-everything freestyle ski, turning the entire mountain into his own playground. Wesson is known to slay mid-winter pow and then send ‘er through spring park laps just as easily thanks to the Blend’s Sintered Fatty™ base. This ski keeps it light for effortless park performance while delivering stability and power at high speeds. Want to ride the stick that Will used to win an X-Games gold? Ride the LINE Blend.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_blend_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 100
--     Length cm: 171, 178, 185,
--     Shape mm: 132-100-122,
--     Sidecut m: 21 (178cm),
--     Stance mm: -40,
--     Weight: 1,935 g/ski (178cm),
--     Profile mm: 4-4-4,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--  VALUES ('CHRONIC', 625.00, 'THE MOST DEMANDED FREESTYLE SKI EVER', 'You don’t even need to read this. We know that you know that LJ Strenio knows that everybody knows that Strenio’s LINE Chronic is the original freestyle ski that sets the standard for the rest of them. Its Fatty™ base and edge pack 30% thicker P-Tex and steel for a more durable punch, and its unique Early Rise™ makes turn initiation easy through all conditions. This means easier take-offs and landings in tracked-out parks! The LINE Chronic will destroy the streets with lightning-fast reflexes then maintain precision everywhere else on the hill.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_chronic_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 92
--     Length cm: 164, 171, 178, 185,
--     Shape mm: 121-92-117,
--     Sidecut m: 19 (178cm),
--     Stance mm: -40,
--     Weight: 1,798 g/ski (178cm),
--     Profile mm: 2-5-2,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--  VALUES ('HONEY BADGER', 500.00, 'HONEY BADGER DONT CARE!', 'Khai Krepela is bringing new blood to the LINE pro team, and he is already picked the brand-new Honey Badger as his tool-of-choice because… well, it just don’t give a sh*t. Designed by LINE to be tough as nails with a classic bamboo core and 4D Fibercap™ fiberglass construction, this spunky park ski has the right amount of bite to kick ass in the street and then take you all over the mountain, too. A replacement upgrade from the legendary Afterbang skis, the LINE Honey Badger is simple, but it’s far from plain.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_honey-badger_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 92
--     Length cm: 155, 166, 172, 177,
--     Shape mm: 120-92-116,
--     Sidecut m: 19.4 (177 cm),
--     Stance mm: -30,
--     Weight: 1650 g/ski (177 cm),
--     Profile mm: 3-3-3,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--  VALUES ('TIGERSNAKE', 450.00, 'HALF TIGER, HALF SNAKE, ALL TEETH', 'The award-winning LINE Tigersnake is your ticket for slipping through trees and pouncing off jumps this season without going bankrupt. Designed by LINE pro Andy Parry and our expert engineerds using real experience and real math, the Tigersnake is the most thoughtfully tech-filled and lightest all-terrain freestyle ski on the market at such an affordable price. Our signature Carbon Ollieband™ adds even more pop than you thought possible. Andy Parry approves this message.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_tigersnake_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 88
--     Length cm: 157, 164, 171, 178,
--     Shape mm: 113-88-109,
--     Sidecut m: 19.9 (178cm),
--     Stance mm: -25,
--     Weight: 1650 g/ski (178cm),
--     Profile mm: 3-4-3,
--     (Tip Early Rise-Camber-Tail Early Rise)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--  VALUES ('SICK DAY 102', 800.00, 'MORE REASON TO CALL IN SICK', 'The Sick Day 102 is your new perfect excuse to ditch that morning meeting, cause it’s the perfect – and award-winning – mix of our speedy 95 and our surfy 110 waist widths. Catch first tracks in the AM and send it on hardpack in the PM – TPS reports can wait. “Skiing has always been fun,” says Jeff, “and it just took the right ski to remind me how much fun I could have outside the park.” The Sick Day 102 is already a classic, but it began as LINE contribution to more funner skiing and making playing hooky well worth it.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_sick-day-102_top?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Waist Width mm: 102
--     Length cm: 172, 179, 186,
--     Shape mm: 135-102-120,
--     Sidecut m: 17.1 (179cm),
--     Stance mm: -75,
--     Weight: 1900 g/sk (179cm),
--     Profile mm: 8-4-3,
--     (Tip Early Rise-Camber-Tail Early Rise)');
--
--
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('POLLARDS PAINT BRUSH', 100.00, 'An Adjustable Pole With Pollard Style', 'Artist and pro skier Eric Pollard has gifted LINE with yet another masterpiece – Pollard’s Paint Brush is an adjustable aluminum freeride ski pole with Screw It All!™ screwdriver-style tips for fine-tuned powder grabbing.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_pollards-paint-brush-pole_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: Adjustable 100-130 (40-52 in)
--   Weight: 245g/stick (100 cm/40" length)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('TOM WALLISCHTICK', 85.00, 'Toms New Pro Pointy Stick', 'The Wallischtick adds more powder-punching power to the LINE collection. This lightweight and sturdy ski pole is Tom Wallischs choice – Wallisch + Stick = Wallischstick. Get it? 9 out of 10 people dont, but that’s okay. You can be the one who does!', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_tom-wallischtick-pole_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: 100-125 (40-50")
-- Weight: 195g/stick (100 cm/40" length)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('GRIP STICK', 80.00, 'Freeride Poles With A Bite', 'Made with lightweight aluminum, the Grip Stick is the only LINE pole that boasts the bite of Snake Grip™ – a contoured grip built for the best hand hugs. The Grip Stick does exactly what it says – grips and sticks (and then unsticks) for unimpaired freeriding.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_grip-stick_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: 100-125 (40-50")
-- Weight: 200g/stick (100 cm/40" length)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('WHIP', 90.00, 'More Durable Than You!', 'ts durable fiberglass shaft means this pole will Whip between turns, withstanding weather and getting after your dream lines. Easily switch between two Screwoff!™ baskets – 60mm and 90mm – depending on the conditions, and get right back to it.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_whip-pole_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: 100-125 (40-50")
-- Weight: 200g per stick (105cm/40" length)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('PIN', 70.00, 'The #1 Pointy Park Sticks', 'Punch it, poke it, pin it – the Pin ski pole has simple and lightweight aluminum construction built for hard charging and precise turns. LINE Grab Tabs™ help keep your hand and this pointy stick’s BMX Rubber grip in a loving relationship, come pow or high water.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_pin-pole_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: 90-115 (36-46")
-- Weight: 195g/stick (105cm/40" length)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('TAC', 55.00, 'Slimmed Design, Slimmer Cost', 'With a fresh make-over, the Tac ski pole is ready to tackle the new season – without breaking the bank. 100% simple, light, and affordable, this aluminum shaft with slimmed-down performance baskets and new adjustable webbing strap make the Tac the perfect pointy stick to stir all-resort mayhem in style.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_tac-pole_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: 90-110 (36-44")
-- Weight: 175g/stick (105cm/40" length)');
-- INSERT INTO products (product_name, product_price, product_description, product_details, product_image_url, product_specs)
--   VALUES ('GET UP', 55.00, 'Grows With Your Grom', 'Groms will reach new heights with this adjustable pointy stick that’s designed to expand with them as they expand upward in height and skill on the slopes. The Get UP is the lightweight ski pole that’ll keep ‘em on their feet time and time again.', 'http://s7d5.scene7.com/is/image/TheGoods/line_1617_get-up_pole?hei=2000&wid=888&resMode=bicub&iccembed=1&fmt=png-alpha&op_usm=1,1', 'Length cm: Adjustable 75-105 (30-42 in)
-- Weight: 210g/stick (100 cm/40" length)');

--
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Troy Tippetts', 52, 'PC', 'https://instagram.fsnc1-5.fna.fbcdn.net/t51.2885-19/11373988_440530339405214_1320781659_a.jpg', 'The GodFather');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Tiffany Denny', 46, 'SnowBasin', 'https://instagram.fsnc1-5.fna.fbcdn.net/t51.2885-19/s320x320/14279030_326655081017988_1249247857_a.jpg', 'Momma T likes to take long walks on the beach');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Colton Tippetts', 27, 'Woodland Realm', 'https://instagram.fsnc1-5.fna.fbcdn.net/t51.2885-15/e35/13392743_1746898288927319_392793637_n.jpg?ig_cache_key=MTI2NjkxNjY5MDE1MjMzODcxOQ%3D%3D.2', 'The Eldest of the Tippetts clan and has served the mountains well');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Bree Tippetts', 23, 'Unknown', 'https://instagram.fsnc1-5.fna.fbcdn.net/t51.2885-19/s320x320/14099840_1181750645229586_1057498972_a.jpg', 'Wife of Colton Seer of the realms');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Carson Tippetts', 25, 'PC', 'https://scontent.fsnc1-5.fna.fbcdn.net/v/t1.0-9/14440839_945010078978555_7768166217823726165_n.jpg?oh=1911265a642ebdddfb95b1c60585d699&oe=58CDBD9D', 'A Family Man');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Lindsay Tippetts', 28, 'Unknown', 'https://scontent.fsnc1-5.fna.fbcdn.net/v/t1.0-9/14222303_10102798292845679_2376778644866032980_n.jpg?oh=a25c2ea5e48d989bfbe702af68ccfa22&oe=5899CE4A', 'Wife of Carson Mother of all');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Noah Tippetts', 20, 'PC', 'https://scontent.fsnc1-5.fna.fbcdn.net/v/t1.0-9/13015608_866133700178724_2571699191736064746_n.jpg?oh=d6ec97ac87621eeb0ea2b12ce3f17e1a&oe=5895A613', 'Creater of this Web App');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Kelsie Wolfley', 21, 'salmon', 'https://scontent.fsnc1-5.fna.fbcdn.net/v/t1.0-9/14021742_10207065401016287_2683886757193148555_n.jpg?oh=1bea835ec891302194615d3c03a6dc16&oe=58951E3D', 'The chosen one');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Jake Tippetts', 18, 'PC', 'https://scontent.fsnc1-5.fna.fbcdn.net/v/t1.0-9/13322139_1003279739768718_187625186339153088_n.jpg?oh=bfe0d3c77826812319718803bcafba67&oe=5887309D', 'The pretty one');
-- INSERT INTO teams (name, age, homemountain, profileimg, bio)
--   VALUES ('Libbey Tippetts', 15, 'PC', 'https://scontent.fsnc1-5.fna.fbcdn.net/v/t1.0-9/13934646_310123446005364_891413060105398292_n.jpg?oh=6a3de5ff601bb43b26940b4b13f1afb0&oe=58CE0D50', 'The youngest and tuffest');
