% Device info example for realtime soundcard throughput. Execute and hear
% the throughput of your soundcard (record + immediately playback). Connect 
% DSP functions with >nameOfYourClassInstance<.connectDSP(@x, fPeriod), 
% where x is the desired DSP function and @x a function handle to it. 
% fPeroid determines the periodicity MATLAB checks for new input data to 
% process. If the DSP function doesn't work, the block length may be too
% short, so MATLAB cant get and change the input data fast enugh. Increase 
% the block length variable or the number of ringbuffer elements.
% The bound when this affects is highly hardware and OS dependent.
% Author: Hagen Jaeger (c) TGM @ Jade Hochschule applied licence see EOF
% Version History:
% Ver. 0.01 initial create (empty) 26.02.2017 HJ
% Ver. 0.1 seems to work 26.02.2017 HJ

clear; close all; clc

iBlockLen = 512;
iNumBuffers = 2;
verbose = true;
streamDur = 10;

cDuplex = MARTA(iBlockLen, iNumBuffers, verbose);

cDuplex.duplexStream();

tmpTimer = timer('StartDelay', streamDur, 'TimerFcn', ...
    'delete(cDuplex); disp(''finished throughput'');');
start(tmpTimer);

%cDuplex.connectDSP(@loPass, 0.01);

%--------------------Licence ---------------------------------------------
% Copyright (c) <2011-2017> Hagen Jaeger
% Institute for Hearing Technology and Audiology
% Jade University of Applied Sciences
% All rights reserved.

% Redistribution and use in source and binary forms, with or without 
% modification, are permitted provided that the following conditions are met:
% 1. Redistributions of source code must retain the above copyright notice, 
%    this list of conditions and the following disclaimer.
% 2. Redistributions in binary form must reproduce the above copyright 
%    notice, this list of conditions and the following disclaimer in 
%    the documentation and/or other materials provided with the distribution.
% 3. Neither the name of the copyright holder nor the names of its 
%    contributors may be used to endorse or promote products derived from 
%    this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
% FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
% COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
% INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
% BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
% OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
% ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
% TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
% USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.