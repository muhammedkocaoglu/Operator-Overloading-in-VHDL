----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Muhammed KOCAOGLU
-- 
-- Create Date: 01/02/2022 12:25:29 AM
-- Design Name: 
-- Module Name: OperatorOverloading - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.OperatorOverloading_pkg.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY OperatorOverloading IS
    PORT (
        CLK   : IN STD_LOGIC;
        Din_a : IN array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0);
        Din_b : IN array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0);
        Dout  : OUT array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0)
    );
END OperatorOverloading;

ARCHITECTURE Behavioral OF OperatorOverloading IS

    SIGNAL concatResult  : array3D(0 TO 4)(0 TO 6)(7 + 8 DOWNTO 0) := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL concatResult2 : array3D(0 TO 4)(0 TO 6)(7 + 8 DOWNTO 0) := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL MulResult     : array3D(0 TO 4)(0 TO 6)(7 + 8 DOWNTO 0) := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL xorResult     : array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0)     := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL andResult     : array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0)     := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL orResult      : array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0)     := (OTHERS => (OTHERS => (OTHERS => '0')));
BEGIN

    P_MAIN : PROCESS (CLK)
    BEGIN
        IF rising_edge(CLK) THEN
            Dout          <= Din_a + Din_b;
            concatResult  <= x"45" & Din_a;
            concatResult2 <= Din_a & Din_b;
            MulResult     <= Din_a * Din_b;
            xorResult     <= Din_a XOR Din_b;
            andResult     <= Din_a AND Din_b;
            orResult      <= Din_a OR Din_b;
        END IF;
    END PROCESS;
END Behavioral;
