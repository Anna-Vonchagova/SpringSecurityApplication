create table category
(
    id   serial not null,
    name varchar(255),
    primary key (id)
);

create table image
(
    id         serial not null,
    file_name  varchar(255),
    product_id int4   not null,
    primary key (id)
);

create table orders
(
    id         serial not null,
    count      int4   not null,
    date_time  timestamp,
    number     varchar(255),
    price      float4 not null,
    status     int4,
    person_id  int4   not null,
    product_id int4   not null,
    primary key (id)
);

create table person
(
    id       serial not null,
    login    varchar(50),
    password varchar(255),
    role     varchar(255),
    primary key (id)
);

create table product
(
    id                   serial       not null,
    date_time_of_created timestamp,
    description          text         not null,
    price                float4       not null check (price >= 1),
    seller               varchar(255) not null,
    title                text         not null,
    warehouse            varchar(255) not null,
    category_id          int4         not null,
    primary key (id)
);

create table product_cart
(
    id         serial not null,
    person_id  int4,
    product_id int4,
    primary key (id)
);

alter table product
    add constraint UK_qka6vxqdy1dprtqnx9trdd47c unique (title);

alter table image
    add constraint FKgpextbyee3uk9u6o2381m7ft1 foreign key (product_id) references product;

alter table orders
    add constraint FK1b0m4muwx1t377w9if3w6wwqn foreign key (person_id) references person;

alter table orders
    add constraint FK787ibr3guwp6xobrpbofnv7le foreign key (product_id) references product;

alter table product
    add constraint FK1mtsbur82frn64de7balymq9s foreign key (category_id) references category;

alter table product_cart
    add constraint FKsgnkc1ko2i1o9yr2p63ysq3rn foreign key (person_id) references person;

alter table product_cart
    add constraint FKhpnrxdy3jhujameyod08ilvvw foreign key (product_id) references product;

insert into person (login, password, role) values
('admin', '$2a$10$O1Vpjhyp6owzYgB1Jg/ufemwaoBPGTVUb0Q2UQrrwdzs525UiVIrS', 'ROLE_ADMIN'),  --password aB123/
('user123', '$2a$10$O1Vpjhyp6owzYgB1Jg/ufemwaoBPGTVUb0Q2UQrrwdzs525UiVIrS', 'ROLE_USER');  --password aB123/

insert into category (name) values
('Видеокарты'), ('Процессоры'), ('Материнские платы');

insert into product (title, description, price, seller, warehouse, category_id) values
('GeForce GT 1030', 'Видеокарта MSI GeForce GT 1030 2 ΓБ Retail', 5000, 'МВидео', 'г.Москва', 1),
('GeForce RTX 3070', 'Видеокарта Gigabyte GeForce RTX 3070 8 ΓБ Retail (rev. 2.0)', 25000, 'МВидео', 'г.Москва', 1),
('GeForce RTX 3050', 'Видеокарта MSI GeForce RTX 3050 8 ΓБ Retail', 15000, 'МВидео', 'г.Москва', 1),
('Intel Core i3', 'Процессор Intel Core i3-10105F', 5000, 'МВидео', 'г.Москва', 2),
('Intel Core i5', 'Процессор Intel Core i5-10400F BOX', 10000, 'МВидео', 'г.Москва', 2),
('Intel Core i7', 'Процессор Intel Core i7-11700KF BOX', 20000, 'МВидео', 'г.Москва', 2),
('MSI Intel H310', 'Материнская плата MSI Intel H310 H310M PRO-VDH PLUS', 5000, 'МВидео', 'г.Москва', 3),
('ASUS Intel H510', 'Материнская плата ASUS Intel H510 PRIME H510M-R-SI', 8000, 'МВидео', 'г.Москва', 3),
('Gigabyte LGA 1700', 'Материнская плата Gigabyte LGA 1700 Intel Z690 Z690M DS3H', 12000, 'МВидео', 'г.Москва', 3);

insert into image (file_name, product_id) values
('GPU1.png', 1), ('GPU2.png', 2), ('GPU3.png', 3),
('CPU1.jpg', 4), ('CPU2.jpg', 5), ('CPU3.jpg', 6),
('motherboard1.jpg', 7), ('motherboard1.jpg', 8), ('motherboard1.jpg', 9);


