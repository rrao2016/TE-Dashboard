BEGIN TRANSACTION;
DROP TABLE IF EXISTS placements CASCADE;
DROP SEQUENCE IF EXISTS seq_placement_id CASCADE;

CREATE SEQUENCE seq_placement_id
        INCREMENT BY 1
        NO MAXVALUE
        NO MINVALUE
        CACHE 1;
        
CREATE TABLE placements (
        placement_id serial NOT NULL,
        company_name varchar(200) NOT NULL,
        street_address varchar(100),
        city varchar(50) NOT NULL,
        state varchar(50) NOT NULL,
        zipcode int NOT NULL,
        lat float(8) NOT NULL,
        long float(8) NOT NULL,
        CONSTRAINT PK_placement PRIMARY KEY (placement_id)
);

DROP TABLE IF EXISTS stories CASCADE;

CREATE TABLE stories (
        story_id serial NOT NULL,
        first_name varchar(50) NOT NULL,
        title varchar(50) NOT NULL,
        message varchar(500) NOT NULL,
        CONSTRAINT PK_story_id PRIMARY KEY (story_id)
);

INSERT INTO stories (first_name, title, message) VALUES ('Trevor', 'Very Worthwhile', 'It gave me all of the tools necessary to help build this website.');

INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 1','123 Fake St.','Milwaukee', 'WI', 53207, 42.98408453223022, -87.9073865416193);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 2','123 Fake St.','Milwaukee', 'WI', 53207, 43.503282049374924, -88.64966859320072);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 3','123 Fake St.','Milwaukee', 'WI', 53207, 42.28271292353316, -91.32749332406604);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 4','123 Fake St.','Milwaukee', 'WI', 53207, 42.27250894590221, -89.24898061672448);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 5','123 Fake St.','Chicago', 'IL', 53207, 40.68726226869316, -89.41942073092336);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 6','123 Fake St.','Chicago', 'IL', 53207, 41.13215310362801, -87.79188224770829);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 7','123 Fake St.','Chicago', 'IL', 53207, 39.999690357089015, -89.39875752863819);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 8','123 Fake St.','Chicago', 'IL', 53207, 38.38277779117093, -88.68157656423178);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 9','123 Fake St.','Chicago', 'IL', 53207, 41.44741924581196, -90.35166833394187);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 10','123 Fake St.','Chicago', 'IL', 53207, 42.035275464198364, -87.75270807755453);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 11','123 Fake St.','Chicago', 'IL', 53207, 38.123646649414546, -88.82366108358698);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 12','123 Fake St.','Chicago', 'IL', 53207, 39.51810251956616, -87.9031367612007);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 13','123 Fake St.','Chicago', 'IL', 53207, 42.37576442277213, -90.07659696683497);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 14','123 Fake St.','Indianapolis', 'IN', 53207, 41.026154192892115, -86.82289726132196);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 15','123 Fake St.','Indianapolis', 'IN', 53207, 39.07070066889272, -85.364451142220024);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 16','123 Fake St.','Indianapolis', 'IN', 53207, 39.69448161619077, -86.19264791619926);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 17','123 Fake St.','Indianapolis', 'IN', 53207, 40.922127313409554, -85.47431442652648);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 18','123 Fake St.','Detroit', 'MI', 53207, 42.90206011547585, -85.69067488451837);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 19','123 Fake St.','Detroit', 'MI', 53207, 42.28943175476066, -83.2306948338116);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 20','123 Fake St.','Detroit', 'MI', 53207, 43.34610820178167, -83.91886238397876);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 21','123 Fake St.','Detroit', 'MI', 53207, 44.407813086158924, -85.97886125508806);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 22','123 Fake St.','Detroit', 'MI', 53207, 43.12059177062609, -83.54528745916619);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 23','123 Fake St.','Cleveland', 'OH', 44102, 41.47031164934163, -81.7759356062333);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 24','123 Fake St.','Cleveland', 'OH', 53207, 40.43596569465053, -81.93101814605288);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 25','123 Fake St.','Cleveland', 'OH', 53207, 41.227396162226825, -84.04438486356399);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 26','123 Fake St.','Cleveland', 'OH', 53207, 39.34358176015375, -83.0429248427508);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 27','123 Fake St.','Columbus', 'OH', 43205, 41.23577314990087, -84.31400873692196);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 28','123 Fake St.','Columbus', 'OH', 43205, 39.164018199832405, -84.52010250591718);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 29','123 Fake St.','Columbus', 'OH', 43205, 38.91591983002693, -83.41046717359548);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 30','123 Fake St.','Columbus', 'OH', 43205, 41.224255755950004, -84.26806594556638);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 31','123 Fake St.','Columbus', 'OH', 43205, 41.61650406101688, -83.42362431420601);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 32','123 Fake St.','Columbus', 'OH', 45213, 39.179555815053625, -84.45474839943371);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 33','123 Fake St.','Cincinnati', 'OH', 45213, 38.52349523303889, -82.12723755938997);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 34','123 Fake St.','Cincinnati', 'OH', 45213, 39.29289619330437, -81.42411253982871);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 35','123 Fake St.','Cincinnati', 'OH', 45213, 38.96905537579004, -84.63212044157687);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 36','123 Fake St.','Pittsburgh', 'PA', 15206, 41.73138993073945, -79.51249156955899);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 37','123 Fake St.','Pittsburgh', 'PA', 15206, 41.419080059621876, -76.10672975605924);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 38','123 Fake St.','Pittsburgh', 'PA', 15206, 39.95294767007145, -75.49149536394316);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 39','123 Fake St.','Pittsburgh', 'PA', 15206, 40.44706279939595, -79.8587176451728);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 40','123 Fake St.','Pittsburgh', 'PA', 15206, 40.28898998163231, -77.77665167751718);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 41','123 Fake St.','Philadelphia', 'PA', 19146, 39.93200208989653, -75.18825850916606);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 42','123 Fake St.','Philadelphia', 'PA', 19146, 41.8133256692996, -79.97391736364607);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 43','123 Fake St.','Philadelphia', 'PA', 19146, 39.80118711463808, -78.1282141872978);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 44','123 Fake St.','Arlington', 'VA', 22203, 38.8838309210364, -77.13289635551041);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 45','123 Fake St.','Arlington', 'VA', 22203, 39.29289619198225, -77.05155401332046);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 46','123 Fake St.','Arlington', 'VA', 22203, 38.592223854430216, -75.18387818011092);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 47','123 Fake St.','Arlington', 'VA', 22203, 37.901985775974424, -77.29325323879462);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 48','123 Fake St.','Arlington', 'VA', 22203, 37.3974744654067, -78.89725718966871);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 49','123 Fake St.','Brooklyn', 'NY', 11237, 40.71143191101403, -73.94389713257738);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 50','123 Fake St.','Brooklyn', 'NY', 11237, 41.97688303566051, -74.45878050368837);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 51','123 Fake St.','Brooklyn', 'NY', 11237, 43.836042874340386, -74.90444306767668);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 52','123 Fake St.','Brooklyn', 'NY', 11237, 42.24633999588136, -79.25503259464274);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 53','123 Fake St.','Charlotte', 'NC', 28203, 35.18676131462476, -80.86378764760768);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 54','123 Fake St.','Charlotte', 'NC', 28203, 36.212636032562294, -80.96313600639195);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 55','123 Fake St.','Charlotte', 'NC', 28203, 36.15083161194299, -77.62462650121952);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 56','123 Fake St.','Charlotte', 'NC', 28203, 34.61518136835542, -77.976854568279);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 57','123 Fake St.','Charlotte', 'NC', 28203, 35.56751132392024, -80.79149551920409);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 58','123 Fake St.','Charlotte', 'NC', 28203, 35.73860013503597, -83.00232417286713);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 59','123 Fake St.','Florida', 'FL', 33167, 30.131994752729668, -81.81795161173721);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 60','123 Fake St.','Florida', 'FL', 33167, 26.77747849361386, -81.63371589059862);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 61','123 Fake St.','Florida', 'FL', 33167, 30.200259764910154, -85.02891703729541);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 62','123 Fake St.','Florida', 'FL', 33167, 26.10472209099801, -80.13927717853409);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 63','123 Fake St.','Atlanta', 'GA', 30313, 33.73743401996909, -84.40201647079803);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 64','123 Fake St.','Atlanta', 'GA', 30313, 31.600387366636248, -84.47620965055356);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 65','123 Fake St.','Atlanta', 'GA', 30313, 33.98951160780425, -83.08128204764712);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 66','123 Fake St.','Atlanta', 'GA', 30313, 34.77147540495579, -85.42370764498057);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 67','123 Fake St.','Atlanta', 'GA', 30313, 33.00185391090654, -82.08114527575194);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 68','123 Fake St.','Atlanta', 'GA', 30313, 31.600387366636248, -83.18655960258346);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 69','123 Fake St.','Houston', 'TX', 77030, 32.825094676870116, -100.03096819250187);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 70','123 Fake St.','Houston', 'TX', 77030, 32.780849761853446, -94.87236800062148);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 71','123 Fake St.','Houston', 'TX', 77030, 31.4882357547659, -102.42603256730348);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 72','123 Fake St.','Houston', 'TX', 77030, 27.503533730860344, -98.32020792478643);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 73','123 Fake St.','Austin', 'TX', 78746, 30.131994807158932, -97.7411812635363);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 74','123 Fake St.','Austin', 'TX', 78746, 31.308513288181395, -104.53158355692989);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 75','123 Fake St.','Austin', 'TX', 78746, 34.120345374388876, -101.18902118770129);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 76','123 Fake St.','Phoenix', 'AZ', 85009, 31.86900036257656, -110.58504269631342);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 77','123 Fake St.','Phoenix', 'AZ', 85009, 35.88800194745609, -113.66441117820119);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 78','123 Fake St.','Phoenix', 'AZ', 85009, 32.73658289718727, -114.11184078668063);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 79','123 Fake St.','Phoenix', 'AZ', 85009, 33.38889851067679, -111.93898542027657);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 80','123 Fake St.','San Diego', 'CA', 92101, 32.74914990881843, -117.14488790004137);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 81','123 Fake St.','San Diego', 'CA', 92101, 33.77100722044345, -117.21752837466688);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 82','123 Fake St.','San Diego', 'CA', 92101, 37.408293830449374, -119.50731519453215);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 83','123 Fake St.','San Diego', 'CA', 92101, 36.925910699739845, -121.71814384819518);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 84','123 Fake St.','San Francisco', 'CA', 94121, 39.123309134067746, -121.19175604202819);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 85','123 Fake St.','San Francisco', 'CA', 94121, 40.297589623268, -124.00793063657514);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 86','123 Fake St.','San Francisco', 'CA', 94121, 41.135415960644785, -120.92856215468737);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 87','123 Fake St.','San Francisco', 'CA', 94121, 41.74703651661501, -123.77105613796842);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 88','123 Fake St.','San Francisco', 'CA', 94121, 36.778488114199675, -118.08606817140634);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 89','123 Fake St.','San Francisco', 'CA', 94121, 34.207455780455064, -115.19093541065713);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 90','123 Fake St.','San Francisco', 'CA', 94121, 37.75559095627929, -122.4131484572107);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 91','123 Fake St.','Seattle', 'WA', 98109, 47.633106427514996, -122.35698554015248);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 92','123 Fake St.','Seattle', 'WA', 98109, 47.57177553792227, -123.55118375672014);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 93','123 Fake St.','Seattle', 'WA', 98109, 48.5915549540606, -121.31403571432303);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 94','123 Fake St.','Seattle', 'WA', 98109, 48.13691240457336, -118.20834784370118);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 95','123 Fake St.','Seattle', 'WA', 98109, 46.65834213330244, -118.65577745218059);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 96','123 Fake St.','Seattle', 'WA', 98109, 48.71326567025224, -121.15611938191853);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 97','123 Fake St.','Seattle', 'WA', 98109, 46.15017695786067, -122.12993676507962);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 98','123 Fake St.','Seattle', 'WA', 98109, 48.172029026554185, -124.49868175114717);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 99','123 Fake St.','Denver', 'CO', 98109, 39.71975104848835, -104.98869186318687);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 100','123 Fake St.','Denver', 'CO', 98109, 40.24295273754947, -107.76033401813186);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 101','123 Fake St.','Denver', 'CO', 98109, 39.63935511614599, -104.94678605209981);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 102','123 Fake St.','Denver', 'CO', 98109, 37.89357541412358, -107.98101609558665);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 103','123 Fake St.','Denver', 'CO', 98109, 38.51291435758006, -102.27480809282682);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 104','123 Fake St.','Honolulu', 'HI', 96813, 19.395374455657095, -155.50896559336175);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 105','123 Fake St.','Honolulu', 'HI', 96813, 21.331516197539415, -157.87616892050238);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 61.21810775759528, -149.90503706158407);

INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 38.55588821995975, -97.15125302317095);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 44.50919437113315, -108.19191744863753);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 45.80667383974415, -98.67288305616795);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 46.95398530888543, -111.76597905578849);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 41.69369139724321, -114.45537167224829);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 36.45067427843763, -109.3950671439094);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 36.07976103571248, -104.12244214585003);
INSERT INTO placements (company_name, street_address, city, state, zipcode, lat, long) VALUES ('Company 106','123 Fake St.','Alaska', 'AK', 99501, 47.86399051457334, -117.32169809735989);




COMMIT TRANSACTION;
