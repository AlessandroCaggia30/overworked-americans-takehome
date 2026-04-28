% Taxable Income in Portugal for year 1985

function[taxable_inc]=pt_taxableinc_1985(wage_principal,wage_spouse,married,children,socsec_p,socsec_s,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11, tax_r12, taxbracket11)



%Work Related Expenses % allowance depending on the marital status
tax_all= min(perc*wage_principal,max_all) + min(perc*wage_spouse,max_all)  +single_all + married*(married_all-single_all);
 
%Family Allowance
 family_all=children*child_all;

 %Social Security Allowance socsec_p ve socsec_s
 
 % Professional Tax Allowance 
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
                                      else if wage_principal>taxbracket10&& wage_principal<=taxbracket11
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
                                      else if wage_spouse>taxbracket10 && wage_spouse<=taxbracket11
                                         protax_s=wage_spouse*tax_r11;
                                          else if wage_spouse>taxbracket11
                                         protax_s=wage_spouse*tax_r12;
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

 taxable_inc=max(0,wage_principal+wage_spouse-tax_all-family_all-socsec_p -socsec_s-protax_p-protax_s);% taxable income of the household




end
