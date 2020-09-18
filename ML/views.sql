use library_ecommerce
go 

/* add reader */
create procedure addReader
(
	@uuid char(32),
	@name varchar(50),
	@cpf char(12),
	@birth date,
	@login varchar(25),
	@password varchar(25),

	@address varchar(50),
	@telephone varchar(11),
	@email varchar(50)
)
as
begin
	insert into people values(@uuid, @name,@cpf,@birth,@login,@password)
	insert into readers values (@uuid, @address, @telephone, @email)
end

go

/* add employee */
create procedure addemployee
(
	@uuid char(32),
	@name varchar(50),
	@cpf char(12),
	@birth date,
	@login varchar(25),
	@password varchar(25),

	@address varchar(50),
	@telephone varchar(11),
	@email varchar(50),

	@type int,
	@status_workers varchar(20)
)
as
begin
	insert into people values (@uuid, @name, @cpf, @birth, @login, @password)
	insert into readers values (@uuid, @address, @telephone, @email)
	insert into employees values (@uuid, @type, @status_workers)
end
go

/* add Books */
create procedure addBook
(
	@uuid char(32),
	@employee_uuid char(32),
	@name varchar(50),
	@author varchar(50),
	@pages varchar(4),
	@publishing_company varchar(50),
	@quantity int,
	@isbn varchar(20),
	@genre varchar(20),
	@parental_rating varchar(2),
	@price money
)
as
begin
	insert into books values(@uuid, @employee_uuid, @name, @author, @pages, @publishing_company, @quantity, @isbn, @genre, @parental_rating, @price)
end
go


/* insert cart item  */
create procedure setCartItem
(
	@cart_uuid char(32),
	@book_uuid char(32),
	@quantity int,
	@price money
)
as
begin
	insert into items_cart values(@cart_uuid, @book_uuid, @quantity, @price)
end
go

/* get ???? */
create procedure getCartItems
(
	@cart_uuid char(32)
)
as
begin
	select * from items_cart where cart_uuid = @cart_uuid 
	-- Falta retornar só os livros
end
go
