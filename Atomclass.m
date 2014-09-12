% Structure:
classdef Atomclass
   properties
      atom_id = 0;
      x = 0;
      y = 0;
      status  = 0;
      num_bond = 0;
      is_bond = [0 0 0 0];
      timer = inf;
      neighbor = [0 0 0 0];
   end
%    methods
%        function
%            
%        end
%    end
end
% td = TensileData;
% td.Material = 'Carbon Steel';
% td.SampleNumber = 001;
% td.Stress = [2e4 4e4 6e4 8e4];
% td.Strain = [.12 .20 .31 .40];
% td.Modulus = mean(td.Stress./td.Strain);
