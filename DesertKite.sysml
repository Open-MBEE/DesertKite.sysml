package 'Desert Kites' {
    binding bind 'Kite Environment'::'Region Earth Surface'.'Kite System'::'Desert Kite'.'Kite Wall'.'Wall Height' = 'Kite Requirements'::'Minimum Wall Height';
    binding bind 'Kite Environment'::'Region Earth Surface'.'Kite System'::'Desert Kite'.'Capture Pit'.'Pit Depth' = 'Kite Requirements'::'Minimum Pit Depth'.ref1;
    binding bind 'Kite Requirements'::'Funnel Gazelles into pits'.'Kite System'::'Desert Kite'.'Capture Pit' = 'Kite Requirements'::'Minimum Pit Capacity';
    first 'Kite Environment'::'Region Earth Surface'::Gazelle.'Move with Herd'.__unnamed1 then 'Kite System'::'Desert Kite'::'Capture Pit'.Capture;
    first 'Kite Environment'::'Region Earth Surface'::Gazelle.'Move with Herd'.__unnamed1 then 'Kite System'::'Desert Kite'::'Kite Wall'.Funnel;
}
package 'Kite Environment' {
    part 'Region Earth Surface' {
        part 'Land Surface';
        part Animals;
        part Gazelle :> Animals {
            action 'Move with Herd' {
                action Jump;
                decide __unnamed1;
                first Jump then __unnamed1;
            }
        }
        connection connect Gazelle to 'Kite System'::'Desert Kite';
        connection connect Animals to 'Land Surface';
        connection connect 'Land Surface' to 'Kite System'::'Desert Kite';
    }
}
package 'Kite Measures';
package 'Kite Enterprise';
package 'Kite Requirements' {
    requirement 'Funnel Gazelles into pits' {
        connection connect 'Funnel Gazelles into pits' to 'Kite System'::'Desert Kite';
    }
    constraint 'Minimum Wall Height' {}
    constraint 'Minimum Pit Depth' {
        inout ref1;
        attribute attribute1;
        binding bind ref1 = attribute1;
    }
    constraint 'Minimum Pit Capacity' {}
}
package 'Kite Views' {
    view Model : 'SysML Standard Diagrams'::gv;
    view 'Kite System Context ' : 'SysML Standard Diagrams'::gv;
    view Measures : 'SysML Standard Diagrams'::gv;
    view 'Kite System' : 'SysML Standard Diagrams'::gv;
    view 'Food Production Enterprise' : 'SysML Standard Diagrams'::gv;
    view 'Kite Functional Design' : 'SysML Standard Diagrams'::gv;
    view 'Desert Kites' : 'SysML Standard Diagrams'::gv;
    view 'Kite Physical ' : 'SysML Standard Diagrams'::gv;
    view 'Kite Requirments' : 'SysML Standard Diagrams'::gv;
    view 'Kite System omni' : 'SysML Standard Diagrams'::gv;
}
package 'Kite System' {
    part 'Desert Kite' {
        part 'Kite Wall' {
            attribute 'Wall Height';
            action Funnel {
                action 'Block Exiting ';
                first Funnel then 'Block Exiting ';
            }
        }
        part 'Capture Pit' {
            attribute 'Pit Depth';
            attribute 'Pit Capacity';
            action Capture;
        }
        connection connect 'Desert Kite' to 'Kite Wall';
        connection connect 'Capture Pit' to 'Desert Kite';
        connection connect 'Kite Wall' to 'Capture Pit';
        attribute 'Animal Capture Rate' :>> OOSEM::MOE;
        package 'Kite Functions';
        part 'Rock Lined Pit' [1..10] {
            part 'Cylindrical Rock Wall Liner' [1] {
                part 'Rocks Sized for Pit Wall Lining' [*];
            }
            part 'Cylindrcial Cavity ';
            connection connect 'Cylindrcial Cavity ' to 'Cylindrical Rock Wall Liner';
        }
        part <RWA> 'Rock Wall Assmbley' [2..10] {
            part 'Wall Segments' {
                part 'Rocks Sized for Walls';
            }
        }
    }
}
