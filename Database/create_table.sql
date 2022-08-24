use vegefood;

create table product (
	id bigint NOT NULL PRIMARY KEY auto_increment,
	name VARCHAR(255) NOT NULL,
	price DOUBLE not null,
    	image varchar(255) not null,
    	discount double null,
    	description text null,
    	categoryid bigint NULL
);

create table category (
	id bigint NOT NULL PRIMARY KEY auto_increment,
    	name VARCHAR(255) NOT NULL
);

alter table product add constraint fk_product_category foreign key (categoryid) references category(id);
