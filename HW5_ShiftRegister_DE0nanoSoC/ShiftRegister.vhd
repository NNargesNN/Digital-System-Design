
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ShiftRegister IS
	PORT (
		clear 		: IN  std_logic;
		mode 	    : IN std_logic_vector(1 DOWNTO 0);
		clock 		: IN  std_logic;
		serial 	    : IN std_logic_vector(1 DOWNTO 0);
 		parallel   : IN std_logic_vector(3 DOWNTO 0)	;
		outputs 	: OUT std_logic_vector(3 DOWNTO 0)
       
      
    );
END ShiftRegister;


ARCHITECTURE ShiftRegister_arch OF ShiftRegister IS
Signal temp_outputs : std_logic_vector (3 DOWNTO 0):="0000";
BEGIN
    PROCESS (clear , clock)
    BEGIN
        
        if clear = '0' then
            temp_outputs <= "0000";
        elsif clock = '1' AND clock'EVENT then 
           
            if mode = "11" then 
                temp_outputs <= parallel;
            
            elsif mode = "01" then 
                temp_outputs <= serial(0) & temp_outputs(3 downto 1);
           
            elsif mode = "10" then 
                temp_outputs <= temp_outputs(2 downto 0) & serial(1);
                else
                    temp_outputs <= temp_outputs;
            end if;
            
        end if;

        
    END PROCESS;
	
    outputs<=temp_outputs;
END ShiftRegister_arch;

