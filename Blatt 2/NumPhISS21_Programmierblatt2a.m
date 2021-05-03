function   [xfine,yfine,c,threshold] = NumPhISS21_Programmierblatt2a(y,M)

%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 2a
%   Abgabe bis zum 05.05.2021
%
%   Student*in 1: Vorname, Nachname, Matrikelnummer
%   Student*in 2: Vorname, Nachname, Matrikelnummer
%
%   Programmversion: z.B. Matlab R2021a oder Octave 6.2.0
%
%% function info
%  Periodic interpolation of vector data [y(j,1),..,y(j,d)]
%  at the points x_j=2*pi*j/(n+1), j=0,1,..,n, using complex exponentials
%
% input:
%   y: data for interpolation, y=[y(0,1),..,y(0,d); ... ; y(n,1),..,y(n,d)]
%      is a matrix, each column contains data for one coordinate of the
%      vector-valued interpolant
%   M: for evaluation of the interpolant, use M-1 points between
%      the interpolation nodes x_j
%   t: Quantile (between 0 and 1) for thresholding coefficients
%
% output:
%   xfine  : x-axis for evaluation of interpolant
%   yfine  : values of interpolant
%     c    : coefficient vector [c_0;...;c_n] of interpolant
% threshold: used threshold for denoising
%%

if size(y,1)==1
    y = y(:);  % make it a column vector
end
d = size(y,2);    % space dimension for curve interpolation

n = size(y,1)-1;  % the length for fft is n+1
xfine = (1/(M*(n+1))*[0:M*(n)])';

c = 1/(n+1)*fft(y);   % columnwise fft gives coefficients of interpolant

%% Einfuegen der Rausch-Unterdrueckung
%...




%%

% computation of interpolant at points in xfine using ifft of length n+1
yfine = zeros(M*(n)+1,d);
part = zeros(n+1,d);
N1 = ceil((n+1)/2);
ktil = [0:n]' - (n+1)*([0:n]'>=N1);  % convert high frequencies
     % to negative frequencies, e.g.  n to -1, n-1 to -2, etc.


for ell=0:M-1
    factor = exp(2*pi*1i*ell/(M*(n+1))*ktil);
    c_ell = repmat(factor,1,d).*c;
    part = (n+1)*ifft(c_ell);
    yfine(ell+1:M:ell+1+n*M,:) = part;
end
yfine(end,:) = yfine(1,:);  % add last value at 2*pi

% for real data y and odd n (which is most popular for fft: use n+1 as a
% power of 2) we change the highest frequency to a pure cosine
if (n+1)==(2*N1) && norm(imag(y))<eps
    yfine = yfine - 1i*sin(2*pi*(N1-n-1)*xfine)*c(N1+1,:);
end
