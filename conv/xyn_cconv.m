function varargout = xyn_cconv(varargin)
% XYN_CCONV MATLAB code for xyn_cconv.fig
%      XYN_CCONV, by itself, creates a new XYN_CCONV or raises the existing
%      singleton*.
%
%      H = XYN_CCONV returns the handle to a new XYN_CCONV or the handle to
%      the existing singleton*.
%
%      XYN_CCONV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XYN_CCONV.M with the given input arguments.
%
%      XYN_CCONV('Property','Value',...) creates a new XYN_CCONV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before xyn_cconv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to xyn_cconv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help xyn_cconv

% Last Modified by GUIDE v2.5 07-Dec-2016 09:45:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @xyn_cconv_OpeningFcn, ...
                   'gui_OutputFcn',  @xyn_cconv_OutputFcn, ...
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


% --- Executes just before xyn_cconv is made visible.
function xyn_cconv_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to xyn_cconv (see VARARGIN)
x.index = [0 1 2 3];
x.value = [1 3 2 -1];
h.index = [0 1 2 3];
h.value = [1 -1 0 1];
stem(handles.axes1,x.index,x.value,'.');
set(handles.axes1,'XLim',[-4 8]);
stem(handles.axes2,h.index,h.value,'.');
set(handles.axes2,'XLim',[-4 8]);

handles.track = 0;
% Choose default command line output for xyn_cconv
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes xyn_cconv wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = xyn_cconv_OutputFcn(hObject, eventdata, handles) 
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
% y.value = conv1(x.value, h.value);
m = length(x.value);
n = length(h.value);
N = n + m - 1;

handles.min = -n;
handles.max = m+n;

h1.value = h.value(end:-1:1);

b = zeros(1,n);
x.value = [b x.value b 0];
x.index = -n:n+m ;
b = zeros(1,m + n);
h1.value = [0 h1.value b];
h1.index = -n:n+m;

stem(handles.axes1,x.index,x.value,'.');
set(handles.axes1,'XLim',[-n n+m]);
handles.x = x;
handles.h = h1;
handles.m = m;
handles.n = n;
for k = 1:m+n
    value = circshift(h1.value,[0,k-1]);
    stem(handles.axes2,h1.index,value,'.');
    set(handles.axes2,'XLim',[-n n+m]);
	
	y.index = -n:m+n-1;
	y.value(find(y.index==k - 1)) = value * x.value';
	hold on
    stem(handles.axes3,y.index(find(y.index==k - 1)),y.value(find(y.index==k - 1)),'.','Color',[0,0,1]);
    set(handles.axes3,'XLim',[-n n+m]);
    ylim(handles.axes3,[-2,4]);
    hold off
    
	pause(0.5);
end
guidata(hObject, handles);

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.track == true
    m = handles.m;
    n = handles.n;
    x = handles.x;
    h1 = handles.h;
    currPt = get(handles.axes3, 'CurrentPoint');
    px = currPt(1,1);
    if(px>handles.min&&px<handles.max)
        axes(handles.axes3);
        cla;
        km = (px-handles.min)/(handles.max-handles.min)*handles.max;
        for k = 1:km
            value = circshift(h1.value,[0,k-1]);
            stem(handles.axes2,h1.index,value,'.');
            set(handles.axes2,'XLim',[-n n+m]);
            y.index = -n:m+n-1;
            y.value(find(y.index==k - 1)) = value * x.value';
            hold on
            stem(handles.axes3,y.index(find(y.index==k - 1)),y.value(find(y.index==k - 1)),'.','Color',[0,0,1]);
            set(handles.axes3,'XLim',[-n n+m]);
            ylim(handles.axes3,[-2,4]);
            hold off
        end
    end
end


function pushbutton2_Callback(hObject, eventdata, handles)
handles.track = ~handles.track;
guidata(hObject, handles);