function [] = the_matrix_lab_has_you(my_firstname)
%
% Author : nicolas.douillet9 (at) gmail.com, 2020-2024.
%
%
% /_!_\ Caution : this program clears your Matlab console and may also
% change some of your Matlab preferences (font and background colors) if
% interrupted while running. /_!_\ NB : to recover, Matlab (R) default font
% is 'Monospaced'.
%
%
% Input argument (optional)
%
% - my_firstname : character string 


clc;

if nargin < 1 || ~ischar(my_firstname)
    
    my_firstname = 'Neo';    
    
end

% Get current display preferences
o_text_color = com.mathworks.services.Prefs.getColorPref('ColorsText');
o_text_style = com.mathworks.services.Prefs.getFontPref('TextFont');
o_bckgd_color = com.mathworks.services.Prefs.getColorPref('ColorsBackground');

% Play intro sound
[y,Fs] = audioread('dissolved_girl_matrix_cut_lower.mp3');
sound(y,Fs);

pause(18);
commandwindow;
[y,Fs] = audioread('screen_keyboard_isolated_touch_sound_amplified_15dB.mp3');

% Set the Matrix display preferences : monospaced, 24 bold green font, black background
mtx_color = [0 0.5 0];
mtx_font = 'Monospaced';
mtx_font_size = 24;
mtx_bckgd_clr = [0 0 0];

com.mathworks.services.Prefs.setColorPref('ColorsText',java.awt.Color(mtx_color(1), mtx_color(2), mtx_color(3)));
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsText'); clear('mtx_color')

F = java.awt.Font(mtx_font,java.awt.Font.BOLD,mtx_font_size);
com.mathworks.services.Prefs.setFontPref('TextFont',F);

matchClass = 'javax.swing.JTextArea$AccessibleJTextArea';
cmdWinDoc  = com.mathworks.mde.cmdwin.CmdWinDocument.getInstance;
cmdWinListener = cmdWinDoc.getDocumentListeners;

for i = 1:length(cmdWinListener)
    
  if isa(cmdWinListener(i), matchClass)
      
    cmdWinListener(i).setFont(F);
    
    break;
    
  end
  
end

com.mathworks.services.Prefs.setColorPref('ColorsBackground',java.awt.Color(mtx_bckgd_clr(1), mtx_bckgd_clr(2), mtx_bckgd_clr(3)));
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsBackground'); clear('mtx_bckgd_clr')
pause(1);

% Print "Wake up, [my_firstname]... "
fprintf('Wake ');
sound(y,Fs);
pause(0.5);
fprintf('up ');
sound(y,Fs);
pause(0.5);
fprintf('%s...\n',my_firstname);
sound(y,Fs);
pause(3);
clc;

% Print "The matrix lab has you..."
matrix_text = 'The matrix lab has you...';

for j = 1:length(matrix_text)
    
    fprintf(matrix_text(j));
    pause(0.5*rand);
    sound(y,Fs);
    
end

fprintf('\n');
pause(3);
clc;

% Print "Follow the white rabbit."
rabbit_text = 'Follow the white rabbit.';

for j = 1:length(rabbit_text)
    
    fprintf(rabbit_text(j));
    pause(0.1*rand);    
    sound(y,Fs);    
    
end

fprintf('\n');
pause(3);
clc;

% Print "Knock, knock, [my_firstname]."
fprintf('Knock, knock, %s.\n',my_firstname);

% Play knock, knock sound.
[y,Fs] = audioread('knocknock.mp3');
sound(y,Fs);
pause(3);
clc;

% Set back previous display preferences
com.mathworks.services.Prefs.setColorPref('ColorsText',o_text_color);
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsText'); clear('o_text_color')

com.mathworks.services.Prefs.setFontPref('TextFont',o_text_style);

for i = 1:length(cmdWinListener)
    
    if isa(cmdWinListener(i), matchClass)
        
        cmdWinListener(i).setFont(o_text_style);
        
        break;
        
    end
    
end

clear('o_text_style');

com.mathworks.services.Prefs.setColorPref('ColorsBackground',o_bckgd_color);
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsBackground'); clear('o_bckgd_color');


end % the_matrix_lab_has_you
Neo
function [] = the_matrix_lab_has_you(my_firstname)
%
% Author :GitHub Copilot
%
% /_!_\ Caution : this program clears your Matlab console and may also
% change some of your Matlab preferences (font and background colors) if
% interrupted while running. /_!_\ NB : to recover, Matlab (R) default font
% is 'Monospaced'.
%function tests = test_the_matrix_lab_has_you
tests = functiontests(localfunctions);
end

function testDefaultName(testCase)
    try
        the_matrix_lab_has_you();
        verifyTrue(testCase, true); % If no error, pass
    catch
        verifyTrue(testCase, false); % If error, fail
    end
end

function testCustomName(testCase)
    try
        the_matrix_lab_has_you('Trinity');
        verifyTrue(testCase, true);
    catch
        verifyTrue(testCase, false);
    end
end

function testInvalidInput(testCase)
    try
        the_matrix_lab_has_you(123);
        verifyTrue(testCase, true);
    catch
        verifyTrue(testCase, false);
    end
end

