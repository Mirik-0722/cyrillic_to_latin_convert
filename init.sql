// create table
create table cyrillic_to_latin (
    cyrillic varchar(5),
    latin varchar (5)
);

insert into cyrillic_to_latin
values ('Ў', 'O`'),
       ('Ғ', 'G`'),
       ('Ш', 'SH'),
       ('Ч', 'CH'),
       ('Ё', 'YO'),
       ('Ю', 'YU'),
       ('Я', 'YA'),
       ('Э', 'E'),
       ('Ц', 'S'),
       ('А', 'A'),
       ('Б', 'B'),
       ('Д', 'D'),
       ('Е', 'E'),
       ('Ф', 'F'),
       ('Г', 'G'),
       ('Ҳ', 'H'),
       ('И', 'I'),
       ('Ж', 'J'),
       ('К', 'K'),
       ('Л', 'L'),
       ('М', 'M'),
       ('Н', 'N'),
       ('О', 'O'),
       ('П', 'P'),
       ('Қ', 'Q'),
       ('Р', 'R'),
       ('С', 'S'),
       ('Т', 'T'),
       ('У', 'U'),
       ('В', 'V'),
       ('Х', 'X'),
       ('Й', 'Y'),
       ('З', 'Z');

// create function

create or replace function cyrillic_to_latin_convert(a character varying)
    returns text
    language plpgsql
as
$$
DECLARE
    t cyrillic_to_latin;
BEGIN
    a := upper(a);
    for t in select * from cyrillic_to_latin
        loop
            a := replace(a, t.cyrillic, t.latin);
        end loop;

    return a;
END;
$$;
