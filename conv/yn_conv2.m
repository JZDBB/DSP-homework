function varargout = yn_conv2(varargin)
% YN_CONV2 MATLAB code for yn_conv2.fig
%      YN_CONV2, by itself, creates a new YN_CONV2 or raises the existing
%      singleton*.
%
%      H = YN_CONV2 returns the handle to a new YN_CONV2 or the handle to
%      the existing singleton*.
%
%      YN_CONV2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YN_CONV2.M with the given input arguments.
%
%      YN_CONV2('Property','Value',...) creates a new YN_CONV2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before yn_conv2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to yn_conv2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help yn_conv2

% Last Modified by GUIDE v2.5 11-Dec-2016 22:32:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yn_conv2_OpeningFcn, ...
                   'gui_OutputFcn',  @yn_conv2_OutputFcn, ...
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


% --- Executes just before yn_conv2 is made visible.
function yn_conv2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to yn_conv2 (see VARARGIN)
x0.index = [0 1 2 3];
x0.value = [1 3 2 -1];
h0.index = [0 1 2 3];
h0.value = [1 -1 0 1];
stem(handles.axes1,x0.index,x0.value,'.');
set(handles.axes1,'XLim',[-4 8]);
stem(handles.axes2,h0.index,h0.value,'.');
set(handles.axes2,'XLim',[-4 8]);
% Choose default command line output for yn_conv2
handles.x = x0;
handles.h = h0;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes yn_conv2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = yn_conv2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
x0 = handles.x;
h0 = handles.h;
y0.value = yn_conv(x0.value, h0.value);
m = length(x0.value);
n = length(h0.value);
y0.index = 0:m + n -1;

stem(handles.axes1,x0.index,x0.value,'.');
set(handles.axes1,'XLim',[-n n+m]);

for k = 1:m+n
	value = circshift(h1.value,[0,k-1]);
    stem(handles.axes2,h1.index,value,'.');
    set(handles.axes2,'XLim',[-n n+m]);
	
	
end
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
