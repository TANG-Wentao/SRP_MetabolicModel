
%% Lactate-sulfate  160
% Lactate
model = changeRxnBounds(model,'EX_cpd00159_e0',-12.4,'b');

% Sulfate
model = changeRxnBounds(model,'EX_cpd00048_e0',-1000,'l');
model = changeRxnBounds(model,'EX_cpd00048_e0',0,'u');
% Hydrogen
model = changeRxnBounds(model,'EX_cpd11640_e0',0,'b');
% CO2
model = changeRxnBounds(model,'EX_cpd00011_e0',0,'l');
model = changeRxnBounds(model,'EX_cpd00011_e0',1000,'u');
% Formate
model = changeRxnBounds(model,'EX_cpd00047_e0',0,'l');
model = changeRxnBounds(model,'EX_cpd00047_e0',1000,'u');

% Acetate
model = changeRxnBounds(model,'EX_cpd00029_e0',0,'l');
model = changeRxnBounds(model,'EX_cpd00029_e0',1000,'u');
% H2S
model = changeRxnBounds(model,'EX_cpd00239_e0',0,'l');
model = changeRxnBounds(model,'EX_cpd00239_e0',1000,'u');
% Pyruvate
model = changeRxnBounds(model,'EX_cpd00020_e0',0,'b');

% NGAM 
model = changeRxnBounds(model,'R_rxn00062_c0',4.9466,'b')


% Set optimization objective to bio1
model = changeObjective(model,'bio1_c0')

% Perform FBA with Bio1 as the objective, 
FBAsolution = optimizeCbModel(model,'max',0,0)
% Print fluxes
printFluxVector(model, FBAsolution.x, true)


%% Hydrogen-Sulfate         

% Lactate
model = changeRxnBounds(model,'EX_cpd00159_e0',0,'b');

% Sulfate
model = changeRxnBounds(model,'EX_cpd00048_e0',-1000,'l');
model = changeRxnBounds(model,'EX_cpd00048_e0',0,'u');
% Hydrogen
model = changeRxnBounds(model,'EX_cpd11640_e0',-41.67,'b');

% Formate
model = changeRxnBounds(model,'EX_cpd00047_e0',0,'l');
model = changeRxnBounds(model,'EX_cpd00047_e0',1000,'u');

% Acetate
model = changeRxnBounds(model,'EX_cpd00029_e0',-1000,'l');
model = changeRxnBounds(model,'EX_cpd00029_e0',0,'u');

% H2S
model = changeRxnBounds(model,'EX_cpd00239_e0',0,'l');
model = changeRxnBounds(model,'EX_cpd00239_e0',1000,'u');

% Pyruvate
model = changeRxnBounds(model,'EX_cpd00020_e0',0,'b');

% NGAM
model = changeRxnBounds(model,'R_rxn00062_c0',17.88,'b')

% Set optimization objective to bio1
model = changeObjective(model,'bio1')

% Perform FBA with Bio1 as the objective, 
FBAsolution = optimizeCbModel(model,'max',0,0)
% Print fluxes
printFluxVector(model, FBAsolution.x, true)