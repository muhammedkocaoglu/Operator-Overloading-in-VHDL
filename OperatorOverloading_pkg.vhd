----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Muhammed KOCAOGLU
-- 
-- Create Date: 01/02/2022 12:21:40 AM
-- Design Name: Operator Overloading
-- Module Name: OperatorOverloading_pkg - Behavioral
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

PACKAGE OperatorOverloading_pkg IS
    TYPE array2D IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR;
    TYPE array3D IS ARRAY (NATURAL RANGE <>) OF array2D;

    FUNCTION "+" (L : array2D; R : array2D) RETURN array2D;
    FUNCTION "+" (L : array3D; R : array3D) RETURN array3D;
    FUNCTION "*" (L : array3D; R : array3D) RETURN array3D;
    FUNCTION "&" (L : STD_LOGIC_VECTOR; R : array3D) RETURN array3D;
    FUNCTION "&" (L : array3D; R : array3D) RETURN array3D;
    FUNCTION "xor" (L : array3D; R : array3D) RETURN array3D;
    FUNCTION "and" (L : array3D; R : array3D) RETURN array3D;
    FUNCTION "or" (L : array3D; R : array3D) RETURN array3D;
END PACKAGE OperatorOverloading_pkg;

PACKAGE BODY OperatorOverloading_pkg IS
    -- addition overloading for 2d array
    FUNCTION "+" (L : array2D; R : array2D) RETURN array2D IS
        CONSTANT msb1 : NATURAL := L'length - 1;
        CONSTANT msb2 : NATURAL := L(0)'length - 1;
        VARIABLE sum  : array2D (0 TO msb1)(msb2 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO msb1 LOOP
            sum(i) := L(i) + R(i);
        END LOOP;
        RETURN sum;
    END;
    -- addition overloading for 3d array
    FUNCTION "+" (L : array3D; R : array3D) RETURN array3D IS
        CONSTANT msb1 : NATURAL := L'length - 1;
        CONSTANT msb2 : NATURAL := L(0)'length - 1;
        CONSTANT msb3 : NATURAL := L(0)(0)'length - 1;
        VARIABLE sum  : array3D (0 TO msb1)(0 TO msb2)(msb3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO msb1 LOOP
            FOR j IN 0 TO msb2 LOOP
                sum(i)(j) := L(i)(j) + R(i)(j);
            END LOOP;
        END LOOP;
        RETURN sum;
    END;

    ---- D E P T H 2
    -- D
    -- E
    -- P
    -- T
    -- H
    -- 1
    -- multiplication overloading for 2d and 3d array
    FUNCTION "*" (L : array3D; R : array3D) RETURN array3D IS
        CONSTANT DEPTH1 : NATURAL := L'length - 1;
        CONSTANT DEPTH2 : NATURAL := L(0)'length - 1;
        CONSTANT DEPTH3 : NATURAL := (L(0)(0)'length * 2) - 1;
        VARIABLE result : array3D (0 TO DEPTH1)(0 TO DEPTH2)(DEPTH3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO DEPTH1 LOOP
            FOR j IN 0 TO DEPTH2 LOOP
                result(i)(j) := L(i)(j) * R(i)(j);
            END LOOP;
        END LOOP;
        RETURN result;
    END;

    FUNCTION "&" (L : STD_LOGIC_VECTOR; R : array3D) RETURN array3D IS
        CONSTANT DEPTH1 : NATURAL := R'length - 1;
        CONSTANT DEPTH2 : NATURAL := R(0)'length - 1;
        CONSTANT DEPTH3 : NATURAL := R(0)(0)'length - 1;
        CONSTANT DEPTH4 : NATURAL := L'length;
        VARIABLE res    : array3D (0 TO DEPTH1)(0 TO DEPTH2)(DEPTH4 + DEPTH3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO DEPTH1 LOOP
            FOR j IN 0 TO DEPTH2 LOOP
                res(i)(j) := L & R(i)(j);
            END LOOP;
        END LOOP;
        RETURN res;
    END;

    FUNCTION "&" (L : array3D; R : array3D) RETURN array3D IS
        CONSTANT DEPTH1 : NATURAL := R'length - 1;
        CONSTANT DEPTH2 : NATURAL := R(0)'length - 1;
        CONSTANT DEPTH3 : NATURAL := R(0)(0)'length - 1;
        CONSTANT DEPTH4 : NATURAL := L(0)(0)'length;
        VARIABLE result : array3D (0 TO DEPTH1)(0 TO DEPTH2)(DEPTH4 + DEPTH3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO DEPTH1 LOOP
            FOR j IN 0 TO DEPTH2 LOOP
                result(i)(j) := L(i)(j) & R(i)(j);
            END LOOP;
        END LOOP;
        RETURN result;
    END;

    FUNCTION "xor" (L : array3D; R : array3D) RETURN array3D IS
        CONSTANT DEPTH1 : NATURAL := R'length - 1;
        CONSTANT DEPTH2 : NATURAL := R(0)'length - 1;
        CONSTANT DEPTH3 : NATURAL := R(0)(0)'length - 1;
        VARIABLE result : array3D (0 TO DEPTH1)(0 TO DEPTH2)(DEPTH3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO DEPTH1 LOOP
            FOR j IN 0 TO DEPTH2 LOOP
                result(i)(j) := L(i)(j) XOR R(i)(j);
            END LOOP;
        END LOOP;
        RETURN result;
    END;

    FUNCTION "and" (L : array3D; R : array3D) RETURN array3D IS
        CONSTANT DEPTH1 : NATURAL := R'length - 1;
        CONSTANT DEPTH2 : NATURAL := R(0)'length - 1;
        CONSTANT DEPTH3 : NATURAL := R(0)(0)'length - 1;
        VARIABLE result : array3D (0 TO DEPTH1)(0 TO DEPTH2)(DEPTH3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO DEPTH1 LOOP
            FOR j IN 0 TO DEPTH2 LOOP
                result(i)(j) := L(i)(j) AND R(i)(j);
            END LOOP;
        END LOOP;
        RETURN result;
    END;

    FUNCTION "or" (L : array3D; R : array3D) RETURN array3D IS
        CONSTANT DEPTH1 : NATURAL := R'length - 1;
        CONSTANT DEPTH2 : NATURAL := R(0)'length - 1;
        CONSTANT DEPTH3 : NATURAL := R(0)(0)'length - 1;
        VARIABLE result : array3D (0 TO DEPTH1)(0 TO DEPTH2)(DEPTH3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO DEPTH1 LOOP
            FOR j IN 0 TO DEPTH2 LOOP
                result(i)(j) := L(i)(j) OR R(i)(j);
            END LOOP;
        END LOOP;
        RETURN result;
    END;

END PACKAGE BODY OperatorOverloading_pkg;
