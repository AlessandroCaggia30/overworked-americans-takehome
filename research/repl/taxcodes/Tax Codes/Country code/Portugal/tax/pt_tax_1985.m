% Tax calculation function for Portugal 1985

function [inctax] = pt_tax_1985(taxable_inc,married,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,taxbracket11, tax_r12)

%Professional Tax - calculated based on gross income separetely

if wage_principal<=taxbracket1
    protax_p=wage_principal*tax_r1;
else if wage_principal>taxbracket1 && wage_principal<=taxbracket2
        protax_p=wage_principal*tax_r2;
    else if wage_principal>taxbracket2 && wage_principal<=taxbracket3
        protax_p=wage_principal*tax_r3;
            else if wage_principal>taxbracket3 && wage_principal<=taxbracket4
            protax_p=wage_principal*tax_r4;
                else if wage_principal>taxbracket4 && wage_principal<=taxbracket5
                protax_p=wage_principal*tax_r5;
                    else if wage_principal>taxbracket5 && wage_principal<=taxbracket6
                     protax_p=wage_principal*tax_r6;
                         else if wage_principal>taxbracket6 && wage_principal<=taxbracket7
                            protax_p=wage_principal*tax_r7;
                             else if wage_principal>7 && wage_principal<=taxbracket8
                                protax_p=wage_principal*tax_r8;
                                 else if wage_principal>taxbracket8 && wage_principal<=taxbracket9
                                 protax_p=wage_principal*tax_r9;
                                  else if wage_principal>taxbracket9 && wage_principal<=taxbracket10
                                     protax_p=wage_principal*tax_r10;
                                      else if wage_principal>taxbracket10 && wage_principal<=taxbracket11
                                         protax_p=wage_principal*tax_r11;
                                            else if wage_principal>taxbracket11
                                            protax_p=wage_principal*tax_r12;
                                                end
                                          end
                                      end
                                     end
                                 end
                             end
                        end
                    end
                end
        end
    end
end

if wage_spouse <= taxbracket1
    protax_s=wage_spouse*tax_r1;
else if wage_spouse>taxbracket1 && wage_spouse<=taxbracket2
        protax_s=wage_spouse*tax_r2;
    else if wage_spouse>taxbracket2 && wage_spouse<=taxbracket3
        protax_s=wage_spouse*tax_r3;
            else if wage_spouse>taxbracket3 && wage_spouse<=taxbracket4
            protax_s=wage_spouse*tax_r4;
                else if wage_spouse>taxbracket4 && wage_spouse<=taxbracket5
                protax_s=wage_spouse*tax_r5;
                    else if wage_spouse>taxbracket5 && wage_spouse<=taxbracket6
                     protax_s=wage_spouse*tax_r6;
                         else if wage_spouse>taxbracket6 && wage_spouse<=taxbracket7
                            protax_s=wage_spouse*tax_r7;
                             else if wage_spouse>7 && wage_spouse<=taxbracket8
                                protax_s=wage_spouse*tax_r8;
                                 else if wage_spouse>taxbracket8 && wage_spouse<=taxbracket9
                                 protax_s=wage_spouse*tax_r9;
                                  else if wage_spouse>taxbracket9 && wage_spouse<=taxbracket10
                                     protax_s=wage_spouse*tax_r10;
                                      else if wage_spouse>taxbracket10
                                         protax_s=wage_spouse*tax_r11;
                                          end
                                      end
                                     end
                                 end
                             end
                        end
                    end
                end
        end
    end
end
                                      
       
%Complementary tax based on joint taxable income

if married==0
    comptax=  (min(taxable_inc,singtb1)*sint_r1 + min(max(0,taxable_inc-singtb1),(singtb2-singtb1))*sint_r2  + min(max(0,taxable_inc-singtb2),(singtb3-singtb2))*sint_r3 +min(max(0,taxable_inc-singtb3),(singtb4-singtb3))*sint_r4     +min(max(0,taxable_inc-singtb4),(singtb5-singtb4))*sint_r5 +min(max(0,taxable_inc-singtb5),(singtb6-singtb5))*sint_r6      +min(max(0,taxable_inc-singtb6),(singtb7-singtb6))*sint_r7 +min(max(0,taxable_inc-singtb7),(singtb8-singtb7))*sint_r8 + min(max(0,taxable_inc-singtb8),(singtb9-singtb8))*sint_r9   +min(max(0,taxable_inc-singtb9),(singtb10-singtb9))*sint_r10 +min(max(0,taxable_inc-singtb10),(singtb11-singtb10))*sint_r11 + max(0,taxable_inc-singtb11)*sint_r12 ) ;
else
    comptax= 2* (min(taxable_inc,martb1)*mart_r1 + min(max(0,taxable_inc-martb1),(martb2-martb1))*mart_r2  + min(max(0,taxable_inc-martb2),(martb3-martb2))*mart_r3 +min(max(0,taxable_inc-martb3),(martb4-martb3))*mart_r4     +min(max(0,taxable_inc-martb4),(martb5-martb4))*mart_r5 +min(max(0,taxable_inc-martb5),(martb6-martb5))*mart_r6      +min(max(0,taxable_inc-martb6),(martb7-martb6))*mart_r7 +min(max(0,taxable_inc-martb7),(martb8-martb7))*mart_r8 + min(max(0,taxable_inc-martb8),(martb9-martb8))*mart_r9   +min(max(0,taxable_inc-martb9),(martb10-martb9))*mart_r10 + min(max(0,taxable_inc-martb10),(martb11-martb10))*mart_r11 +max(0,taxable_inc-martb11)*mart_r12 ) ;
end

inctax=round(protax_p+protax_s+comptax);

end