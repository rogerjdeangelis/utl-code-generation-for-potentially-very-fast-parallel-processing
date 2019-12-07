Code generation for potentially very fast parallel processing                                                                                    
                                                                                                                                                 
github                                                                                                                                           
https://tinyurl.com/vn6h66t                                                                                                                      
https://github.com/rogerjdeangelis/utl-code-generation-for-potentially-very-fast-parallel-processing                                             
                                                                                                                                                 
Uses macro debug for code generation;                                                                                                            
see  https://www.youtube.com/watch?v=JrxooHTx0c8                                                                                                 
                                                                                                                                                 
and                                                                                                                                              
https://tinyurl.com/y9nfugth                                                                                                                     
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                                       
                                                                                                                                                 
SAS Forum                                                                                                                                        
https://tinyurl.com/vbn33fx                                                                                                                      
https://communities.sas.com/t5/SAS-Programming/Picking-from-2-Datasets-Based-on-Existence-of-Data/m-p/610096                                     
                                                                                                                                                 
*_                   _                                                                                                                           
(_)_ __  _ __  _   _| |_                                                                                                                         
| | '_ \| '_ \| | | | __|                                                                                                                        
| | | | | |_) | |_| | |_                                                                                                                         
|_|_| |_| .__/ \__,_|\__|                                                                                                                        
        |_|                                                                                                                                      
;                                                                                                                                                
                                                                                                                                                 
These are defined in my autoexec;                                                                                                                
                                                                                                                                                 
%let states50= %sysfunc(compbl(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT                                     
NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)) ;                                                                      
                                                                                                                                                 
%let states50q="AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT",
"NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY";                         
                                                                                                                                                 
data hav1st;                                                                                                                                     
                                                                                                                                                 
  array states[50] &states50 (50*1);                                                                                                             
                                                                                                                                                 
  do rec=1 to 2;                                                                                                                                 
    do idx=1 to 50;                                                                                                                              
      if uniform(1234)<.2 then states[idx]=.;                                                                                                    
    end;                                                                                                                                         
    output;                                                                                                                                      
  end;                                                                                                                                           
  drop idx;                                                                                                                                      
run;quit;                                                                                                                                        
                                                                                                                                                 
data hav2nd;                                                                                                                                     
                                                                                                                                                 
  array states[50] &states50 (50*2);                                                                                                             
  do rec=1 to 3;                                                                                                                                 
    output;                                                                                                                                      
  end;                                                                                                                                           
                                                                                                                                                 
run;quit;                                                                                                                                        
                                                                                                                                                 
                                                                                                                                                 
WORK.HAV1ST (has missing values)                                                                                                                 
                                                                                                                                                 
Middle Observation(1 ) of hav1st - Total Obs 2                                                                                                   
                                                                                                                                                 
                       Middle Value                                                                                                              
 -- NUMERIC --  TYPE                                                                                                                             
                                                                                                                                                 
REC              N8       2                                                                                                                      
                                                                                                                                                 
AL               N8       1                                                                                                                      
AK               N8       .                                                                                                                      
AZ               N8       1                                                                                                                      
...                                                                                                                                              
WV               N8       1                                                                                                                      
WI               N8       1                                                                                                                      
WY               N8       1                                                                                                                      
                                                                                                                                                 
                                                                                                                                                 
WORK.HAV2ND  (no missing values)                                                                                                                 
                                                                                                                                                 
Middle Observation(1 ) of hav2nd - Total Obs 3                                                                                                   
                                                                                                                                                 
                       Middle Value                                                                                                              
 -- NUMERIC --  TYPE                                                                                                                             
                                                                                                                                                 
REC              N8       2                                                                                                                      
                                                                                                                                                 
AL               N8       2                                                                                                                      
AK               N8       2                                                                                                                      
AZ               N8       2                                                                                                                      
...                                                                                                                                              
WV               N8       2                                                                                                                      
WI               N8       2                                                                                                                      
WY               N8       2                                                                                                                      
                                                                                                                                                 
*            _               _                                                                                                                   
  ___  _   _| |_ _ __  _   _| |_                                                                                                                 
 / _ \| | | | __| '_ \| | | | __|                                                                                                                
| (_) | |_| | |_| |_) | |_| | |_                                                                                                                 
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                                
                |_|                                                                                                                              
;                                                                                                                                                
                                                                                                                                                 
WORK.HAV2ND  (no missing values)                                                                                                                 
                                                                                                                                                 
Middle Observation(1 ) of hav2nd - Total Obs 3                                                                                                   
                                                                                                                                                 
                       Middle Value                                                                                                              
 -- NUMERIC --  TYPE                                                                                                                             
                                                                                                                                                 
REC              N8       2                                                                                                                      
                                                                                                                                                 
AL               N8       1                                                                                                                      
AK               N8       2  * missing in hav1st slot in hav2nd value                                                                            
AZ               N8       1                                                                                                                      
...                                                                                                                                              
WV               N8       1                                                                                                                      
WI               N8       1                                                                                                                      
WY               N8       1                                                                                                                      
                                                                                                                                                 
* in some cases this can be very fast especially with muti-core and SPDE indexes on hav1st and hav2nd;                                           
                                                                                                                                                 
proc sql;                                                                                                                                        
create table want as select                                                                                                                      
case when t1.AL is missing then t2.AL else t1.AL end AS AL                                                                                       
case when t1.AK is missing then t2.AK else t1.AK end AS AK                                                                                       
case when t1.AZ is missing then t2.AZ else t1.AZ end AS AZ                                                                                       
case when t1.AR is missing then t2.AR else t1.AR end AS AR                                                                                       
case when t1.CA is missing then t2.CA else t1.CA end AS CA                                                                                       
case when t1.CO is missing then t2.CO else t1.CO end AS CO                                                                                       
case when t1.CT is missing then t2.CT else t1.CT end AS CT                                                                                       
case when t1.DE is missing then t2.DE else t1.DE end AS DE                                                                                       
case when t1.FL is missing then t2.FL else t1.FL end AS FL                                                                                       
case when t1.GA is missing then t2.GA else t1.GA end AS GA                                                                                       
case when t1.HI is missing then t2.HI else t1.HI end AS HI                                                                                       
case when t1.ID is missing then t2.ID else t1.ID end AS ID                                                                                       
case when t1.IL is missing then t2.IL else t1.IL end AS IL                                                                                       
case when t1.IN is missing then t2.IN else t1.IN end AS IN                                                                                       
case when t1.IA is missing then t2.IA else t1.IA end AS IA                                                                                       
case when t1.KS is missing then t2.KS else t1.KS end AS KS                                                                                       
case when t1.KY is missing then t2.KY else t1.KY end AS KY                                                                                       
case when t1.LA is missing then t2.LA else t1.LA end AS LA                                                                                       
case when t1.ME is missing then t2.ME else t1.ME end AS ME                                                                                       
case when t1.MD is missing then t2.MD else t1.MD end AS MD                                                                                       
case when t1.MA is missing then t2.MA else t1.MA end AS MA                                                                                       
case when t1.MI is missing then t2.MI else t1.MI end AS MI                                                                                       
case when t1.MN is missing then t2.MN else t1.MN end AS MN                                                                                       
case when t1.MS is missing then t2.MS else t1.MS end AS MS                                                                                       
case when t1.MO is missing then t2.MO else t1.MO end AS MO                                                                                       
case when t1.MT is missing then t2.MT else t1.MT end AS MT                                                                                       
case when t1.NE is missing then t2.NE else t1.NE end AS NE                                                                                       
case when t1.NV is missing then t2.NV else t1.NV end AS NV                                                                                       
case when t1.NH is missing then t2.NH else t1.NH end AS NH                                                                                       
case when t1.NJ is missing then t2.NJ else t1.NJ end AS NJ                                                                                       
case when t1.NM is missing then t2.NM else t1.NM end AS NM                                                                                       
case when t1.NY is missing then t2.NY else t1.NY end AS NY                                                                                       
case when t1.NC is missing then t2.NC else t1.NC end AS NC                                                                                       
case when t1.ND is missing then t2.ND else t1.ND end AS ND                                                                                       
case when t1.OH is missing then t2.OH else t1.OH end AS OH                                                                                       
case when t1.OK is missing then t2.OK else t1.OK end AS OK                                                                                       
case when t1.OR is missing then t2.OR else t1.OR end AS OR                                                                                       
case when t1.PA is missing then t2.PA else t1.PA end AS PA                                                                                       
case when t1.RI is missing then t2.RI else t1.RI end AS RI                                                                                       
case when t1.SC is missing then t2.SC else t1.SC end AS SC                                                                                       
case when t1.SD is missing then t2.SD else t1.SD end AS SD                                                                                       
case when t1.TN is missing then t2.TN else t1.TN end AS TN                                                                                       
case when t1.TX is missing then t2.TX else t1.TX end AS TX                                                                                       
case when t1.UT is missing then t2.UT else t1.UT end AS UT                                                                                       
case when t1.VT is missing then t2.VT else t1.VT end AS VT                                                                                       
case when t1.VA is missing then t2.VA else t1.VA end AS VA                                                                                       
case when t1.WA is missing then t2.WA else t1.WA end AS WA                                                                                       
case when t1.WV is missing then t2.WV else t1.WV end AS WV                                                                                       
case when t1.WI is missing then t2.WI else t1.WI end AS WI                                                                                       
case when t1.WY is missing then t2.WY else t1.WY end AS WY                                                                                       
from hav1st as t1 full outer join hav2nd as t2 on t1.rec = t2.rec ;                                                                              
quit;                                                                                                                                            
run;                                                                                                                                             
                                                                                                                                                 
*                                                                                                                                                
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                               
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                                              
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                              
| .__/|_|  \___/ \___\___||___/___/                                                                                                              
|_|                                                                                                                                              
;                                                                                                                                                
                                                                                                                                                 
These are defined in my autoexec;                                                                                                                
                                                                                                                                                 
%let states50= %sysfunc(compbl(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT                                     
NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)) ;                                                                      
                                                                                                                                                 
%let states50q="AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT",
"NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY";                         
                                                                                                                                                 
%array(sta,values=&states50);                                                                                                                    
                                                                                                                                                 
proc sql;                                                                                                                                        
  create                                                                                                                                         
     table want as                                                                                                                               
  select                                                                                                                                         
     %do_over(sta,phrase=%str(                                                                                                                   
        case                                                                                                                                     
           when t1.? is missing then t2.?                                                                                                        
           else t1.?                                                                                                                             
        end AS ?                                                                                                                                 
        ),between=comma)                                                                                                                         
  from                                                                                                                                           
     hav1st as t1 full outer join hav2nd as t2                                                                                                   
  on                                                                                                                                             
     t1.rec = t2.rec                                                                                                                             
;quit;                                                                                                                                           
                                                                                                                                                 
                                                                                                                                                 
* hihglight code and hit right mouse button(submit);                                                                                             
* then run this and generated code will appear in the log;                                                                                       
data _null_;                                                                                                                                     
  informat clause $171.;                                                                                                                         
  infile "%sysfunc(pathname(work))/mactxt.sas" flowover delimiter=',';                                                                           
  input clause @@;                                                                                                                               
  putlog clause;                                                                                                                                 
run;quit;                                                                                                                                        
                                                                                                                                                 
                                                                                                                                                 
