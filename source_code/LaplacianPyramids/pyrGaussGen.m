function p=pyrGaussGen(img, stopDim)
%
%
%        p=pyrGaussGen(img)
%
%
%        Input:
%           -img: an image
%           -stopDim: minimum dimension
%
%        Output:
%           -p: a Gaussian pyramid of img
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
%

if(~exist('stopDim'))
    stopDim = 1;
end

check=1;
list=[];
while(check)
    %Calculating detail and base layers
    [tL0,tB0]=pyrGaussGenAux(img);
    img=tL0;
    
    %Detail layer
    ts=struct('detail',tB0);
    list=[list,ts];  
    
    %is the smallest dimension bigger than 4?
    check=min(size(img))>stopDim;
end

%Base layer
p=struct('list',list,'base',tL0);

end