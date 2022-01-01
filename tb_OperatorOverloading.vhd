----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2022 12:28:35 AM
-- Design Name: 
-- Module Name: tb_OperatorOverloading - Behavioral
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

ENTITY tb_OperatorOverloading IS
    --  Port ( );
END tb_OperatorOverloading;

ARCHITECTURE Behavioral OF tb_OperatorOverloading IS

    COMPONENT OperatorOverloading IS
        PORT (
            CLK   : IN STD_LOGIC;
            Din_a : IN array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0);
            Din_b : IN array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0);
            Dout  : OUT array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL CLK   : STD_LOGIC := '1';
    SIGNAL Din_a : array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0) := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL Din_b : array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0) := (OTHERS => (OTHERS => (OTHERS => '0')));
    SIGNAL Dout  : array3D(0 TO 4)(0 TO 6)(7 DOWNTO 0) := (OTHERS => (OTHERS => (OTHERS => '0')));

BEGIN
    CLK <= NOT CLK AFTER 5 ns;

    dut : PROCESS
    BEGIN
        WAIT FOR 50 ns;
        Din_a <= ((x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"));
        Din_b <= ((x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"14", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"54", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"12", x"ad"),
            (x"ab", x"87", x"94", x"14", x"36", x"54", x"ed"));

        WAIT FOR 50 ns;
        std.env.finish;
    END PROCESS;
    OperatorOverloading_Inst : OperatorOverloading
    PORT MAP(
        CLK   => CLK,
        Din_a => Din_a,
        Din_b => Din_b,
        Dout  => Dout
    );
END Behavioral;