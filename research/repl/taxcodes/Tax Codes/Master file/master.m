%--------------------------------------------------------------------------
%%%% If you use this code, PLEASE CITE the following paper: %%%%

% "Long-term Changes in Married Couples’ Labor Supply and Taxes: Evidence from the U.S. and Europe Since the 1980s"
% by  A. Bick, B. Brüggemann, N. Fuchs-Schündeln, and H. Paule-Paludkiewicz, 2018, NBER Working Paper 24995.
%--------------------------------------------------------------------------

%Please add the path, where the "Tax Codes" folder is stored to the MATLAB search path

clear all;
w=cd;
addpath(genpath(w));

% Read in data
% Please put the path where the data set is stored in the next line
[id, year, country, married, children, wage_principal, wage_spouse] = textread('put path here\datasetname.txt',... 
     '%f %f %f %f %f %f %f');

%--------------------------------------------------------------------------
%%%%%%      PLEASE CHOOSE      %%%%%%%%

% The OECD does not provide a description of the tax codes for the years 1995 and 2001,
% and in the case for Belgium for 1997 as well. You have three options for how to deal with these years:

% 1 – Apply the tax codes from the preceding year (1994, 1996 for Belgium, 2000, respectively)
% 2 – Apply the tax codes from the subsequent year (1996, 1998 for Belgium, 2002, respectively) 
% 3 – Do not apply any tax code, results in missing values 

% Please substitute "yournumber" in the next line with 1, 2 or 3 depending
% on your preferred option:

missingyears=ones(1,length(id))*yournumber;           
%--------------------------------------------------------------------------

countryn = num2cell(country);
countryn(country == 1) = {'us'};
countryn(country == 2) = {'ger'};
countryn(country == 3) = {'uk'};
countryn(country == 4) = {'it'};
countryn(country == 5) = {'fr'};
countryn(country == 6) = {'ne'};
countryn(country == 7) = {'be'};
countryn(country == 8) = {'pt'};

func= 'tax_';

inctax=NaN(1,length(id));
inctax_p=NaN(1,length(id));
inctax_s=NaN(1,length(id));
localtax=NaN(1,length(id));
socsec=NaN(1,length(id));
socsec_p=NaN(1,length(id));
socsec_s=NaN(1,length(id));
benefit=NaN(1,length(id));
statetax=NaN(1,length(id));
ssc_empr=NaN(1,length(id));
netincome=NaN(1,length(id));
netinc_wobenefit=NaN(1,length(id));

%Defintion of inputs and outputs and computation of taxes
for i=1:length(id) 
    %Output defintion
    if country(i)== 1
        outputs = '[inctax(i),localtax(i),socsec_p(i),socsec_s(i),benefit(i),netincome(i), statetax(i),ssc_empr(i)]';
    elseif country(i)== 2
        outputs	= '[inctax(i),socsec(i),netincome(i),ssc_empr(i)]';
    elseif country(i)== 3 || country(i)==6
        outputs = '[inctax_p(i),inctax_s(i),socsec_p(i),socsec_s(i),benefit(i),netincome(i),ssc_empr(i)]';  
    elseif country(i)==4  
       if year(i)<=1994 || (year(i)==1995 && missingyears(i)==1)
            outputs	= '[inctax(i),localtax(i),socsec(i),benefit(i),netincome(i),netinc_wobenefit(i)]';  
       else
            outputs	= '[inctax(i),localtax(i),socsec(i),benefit(i),netincome(i),netinc_wobenefit(i),ssc_empr(i)]';  
       end
    elseif country(i)== 5
       if year(i)<=1994 || (year(i)==1995 && missingyears(i)==1)
            outputs	= '[inctax(i),socsec(i),benefit(i),netincome(i)]';
       else
            outputs	= '[inctax(i),socsec(i),benefit(i),netincome(i),ssc_empr(i)]';
       end
    elseif country(i)==7
        outputs	= '[inctax(i),localtax(i),socsec(i),benefit(i),netincome(i),ssc_empr(i)]';  
    elseif country(i)== 8
        outputs	= '[inctax(i),socsec_p(i),socsec_s(i),benefit(i),netincome(i),ssc_empr(i)]';  
    end
    
    %Input definition
    if country(i)~=2
        inputs = '(wage_principal(i),wage_spouse(i),married(i),children(i))';  
    elseif country(i)== 2
        inputs = '(wage_principal(i),wage_spouse(i),married(i),children(i), year(i))';  
    end

    %Year definition
    if missingyears(i)==1 
        if (year(i)~=1995)&&(year(i)~=2001) && (year(i)~=1997 && country(i)~=7)
            taxyear=num2str(year(i));
        elseif (year(i)==1995)
            taxyear=num2str(1994); 
        elseif year(i)==1997 && country(i)==7
            taxyear=num2str(1996); 
        elseif (year(i)==2001)
            taxyear=num2str(2000); 
        end
    elseif missingyears(i)==2 || missingyears(i)==3
        if (year(i)~=1995)&&(year(i)~=2001) && (year(i)~=1997 && country(i)~=7)
            taxyear=num2str(year(i));
        elseif (year(i)==1995)
            taxyear=num2str(1996); 
        elseif year(i)==1997 && country(i)==7
            taxyear=num2str(1998); 
        elseif (year(i)==2001)
            taxyear=num2str(2002); 
        end
    end
    
coun = countryn{i};

%Computation of taxes
eval([outputs,'=',func,coun,'_',taxyear, inputs, ';']);

if missingyears(i)==3 && (year(i)==1995 || year(i)==2001 || (year(i)==1997 && country(i)==7))
    inctax(i)=NaN;
    inctax_p(i)=NaN;
    inctax_s(i)=NaN;
    localtax(i)=NaN;
    statetax(i)=NaN;
    socsec(i)=NaN;
    socsec_p(i)=NaN;
    socsec_s(i)=NaN;
    benefit(i)=NaN;
    netincome(i)=NaN;
    netinc_wobenefit(i)=NaN;
    ssc_empr(i)=NaN;
end

if country(i)== 1 || country(i)== 3 || country(i)== 6 || country(i)== 8
    socsec(i)=socsec_p(i)+socsec_s(i);
end

if country(i)== 3 || country(i)== 6 
    inctax(i)=inctax_p(i)+inctax_s(i);
end

end


% Concatenate data
taxdata=[id year country married children wage_principal wage_spouse inctax.' inctax_p.' inctax_s.' localtax.' statetax.' socsec.' socsec_p.' socsec_s.' benefit.' netincome.' netinc_wobenefit.' ssc_empr.'];

% Save data set
% Please put the path where the new data set should be stored in the next line 
textFileName='put path here\newdatasetname.txt'; 
dlmwrite(textFileName,taxdata,'Delimiter','\t');




