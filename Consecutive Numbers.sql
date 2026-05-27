delimeter $$ 
drop procedure if exists 'consecutive' $$
create procedure consecutive(out output int)
begin
    declare val INT default 0;
    declare prevVal INT default 0;
    declare temp INT default 0;
    declare count int default 0;
    declare iterate_over CURSOR for select num from Logs;


    OPEN iterate_over;

    read_loop: LOOP
        fetch next from iterate_over into val;
        if prevVal = next then
            set temp = next;
            set val = temp;
            set count = count + 1;
        else
            set prevVal = next;
            set count = 0;
        end if;
        
        if count = 2 then
            set output = next;
            LEAVE read_loop;
        end if;
    end loop;
    CLOSE iterate_over;
end $$

CALL consecutive(@output)

SELECT @output as ConsecutiveNums;