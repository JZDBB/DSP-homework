function varargout = Gibbs2(varargin)
% GIBBS2 MATLAB code for Gibbs2.fig
%      GIBBS2, by itself, creates a new GIBBS2 or raises the existing
%      singleton*.
%
%      H = GIBBS2 returns the handle to a new GIBBS2 or the handle to
%      the existing singleton*.
%
%      GIBBS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GIBBS2.M with the given input arguments.
%
%      GIBBS2('Property','Value',...) creates a new GIBBS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gibbs2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gibbs2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gibbs2

% Last Modified by GUIDE v2.5 06-Dec-2016 23:18:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gibbs2_OpeningFcn, ...
                   'gui_OutputFcn',  @Gibbs2_OutputFcn, ...
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


% --- Executes just before Gibbs2 is made visible.
function Gibbs2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gibbs2 (see VARARGIN)
handles.N = 1;
set(handles.edit2, 'String', num2str(handles.N));

t = -2: 0.001: 2;
x = 4/pi * sin(t*pi);
y = square(x, 50);
plot(t, x);
hold on
plot(t, y, 'r');
hold off
xlim([-2, 2]);
ylim([-1.5 1.5]);
grid on;
title('���һ�������ź�');
xlabel('t');
ylabel('x(t)');
% Choose default command line output for Gibbs2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gibbs2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gibbs2_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA)
N = str2double(handles.N);
t = -2: 0.001: 2;
x = 4/pi * sin(t*pi);    % the first sin function

for n = 3: 2: N    % Nth harmonic superposition
    pause(2/n);    % pause delay decided by n
    x = x + (4/(n*pi) * sin(n*t*pi));
    y = square(x, 50);   % a square wave
    plot(t, x);          % the main signal wave
    hold on              
    plot(t, y, 'r');     % the square wave
    hold off
    xlim([-2 2]);
    ylim([-1.5 1.5]);
    grid on;
    title('����˹���󶯻�');
    xlabel('t/pi');
    ylabel('x(t)');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.N = get(handles.edit2,'String');
guidata(hObject, handles);
