function varargout = FaceRecGUI(varargin)
% FACERECGUI MATLAB code for FaceRecGUI.fig
%      FACERECGUI, by itself, creates a new FACERECGUI or raises the existing
%      singleton*.
%
%      H = FACERECGUI returns the handle to a new FACERECGUI or the handle to
%      the existing singleton*.
%
%      FACERECGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACERECGUI.M with the given input arguments.
%
%      FACERECGUI('Property','Value',...) creates a new FACERECGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FaceRecGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FaceRecGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FaceRecGUI

% Last Modified by GUIDE v2.5 31-Aug-2017 00:02:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FaceRecGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FaceRecGUI_OutputFcn, ...
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


% --- Executes just before FaceRecGUI is made visible.
function FaceRecGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FaceRecGUI (see VARARGIN)

% Choose default command line output for FaceRecGUI
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FaceRecGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FaceRecGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in HuRad.
function HuRad_Callback(hObject, eventdata, handles)
% hObject    handle to HuRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HuRad


% --- Executes on button press in FmRad.
function FmRad_Callback(hObject, eventdata, handles)
% hObject    handle to FmRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FmRad


% --- Executes on button press in GeoRad.
function GeoRad_Callback(hObject, eventdata, handles)
% hObject    handle to GeoRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of GeoRad


% --- Executes on button press in LoadImgBtn.
function LoadImgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in addImgCible.
function addImgCible_Callback(hObject, eventdata, handles)
% hObject    handle to addImgCible (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
a = uigetfile({'*.*', 'All files'});
img=imread(a);
imshow(img,'parent',handles.axes7); 


% --- Executes on button press in BestMatch.
function BestMatch_Callback(hObject, eventdata, handles)
global img
global matched
% hObject    handle to BestMatch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDAT
min_inv = 10000000; 
cible_inv=invmoments(img);
for i = 1:10 
    str = strcat('s',int2str(i),'_p1.pgm'); 
%     aux = imread(str);
    imshow(aux,'parent',handles.matchedImage); 
    gallery_inv = invmoments(aux);
    hdgc =  hu_distance(gallery_inv,cible_inv);
    if  hdgc<min_inv
        min_inv = hdgc;
        matched = aux;
    end; 
end; 
imshow(matched,'parent',handles.matchedImage); 

% --- Executes on button press in IndexImgBtn.
function IndexImgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to IndexImgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in goodMatch.
function goodMatch_Callback(hObject, eventdata, handles)
% hObject    handle to goodMatch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in badMatch.
function badMatch_Callback(hObject, eventdata, handles)
% hObject    handle to badMatch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on button press in ResultBtn.
function ResultBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ResultBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
