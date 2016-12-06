function varargout = cconv(varargin)
% CCONV MATLAB code for cconv.fig
%      CCONV, by itself, creates a new CCONV or raises the existing
%      singleton*.
%
%      H = CCONV returns the handle to a new CCONV or the handle to
%      the existing singleton*.
%
%      CCONV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CCONV.M with the given input arguments.
%
%      CCONV('Property','Value',...) creates a new CCONV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cconv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cconv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cconv

% Last Modified by GUIDE v2.5 05-Dec-2016 16:36:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cconv_OpeningFcn, ...
                   'gui_OutputFcn',  @cconv_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cconv is made visible.
function cconv_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cconv (see VARARGIN)


% Choose default command line output for cconv
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cconv wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cconv_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)

x.index = [0 1 2 3];
x.value = [1 3 2 -1];
h.index = [0 1 2 3];
h.value = [1 -1 0 1];
h1.value = h.value(end:-1:1);
h.index = -h.index;
h.index = h.index(end:-1:1);
m = length(x.value);
n = length(h.value);
N = n + m - 1;
b = zeros(1,n);
for k = 0:2*m
    stem(handles.axes1,x.index,x.value,'.');
    set(handles.axes1,'XLim',[-4 10]);

    h.index = h.index + 1;
    
    stem(handles.axes2,h.index,h1.value,'.');
    set(handles.axes2,'XLim',[-4 10]);
	
% 	if (find(x.value) == 0)
% 		pause(0.5);
% 		return;
% 	end
	
	y.value = x.value.*h.value;
	
	y.index = ;
	y.value = zeros(1,N);
	
	y.value = x.value*h.value;
	
    stem(handles.axes3,n,y,'.');
    set(handles.axes3,'XLim',[-4 10]);
    pause(0.5);
end

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
