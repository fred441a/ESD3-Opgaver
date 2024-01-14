entity Top is
    Port(
        LD0 : out std_logic;
        SW0 : in std_logic;
        SW1 : in std_logic;
        SW2 : in std_logic;
        SW3 : in std_logic;
        )

end Top

architecture behavioral of Top is
begin
    LDO <= (SW0 and SW1) or not (SW2 and SW3)
end behavioral
