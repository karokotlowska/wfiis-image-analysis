classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        Image                         matlab.ui.control.Image
        ConverttoarabicButton         matlab.ui.control.Button
        ConvertednumberTextAreaLabel  matlab.ui.control.Label
        ConvertednumberTextArea       matlab.ui.control.TextArea
        LoadimageButton               matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: LoadimageButton
        function loadImage(app, event)
           [filename,filepath] = uigetfile({'*.*;*.jpg;*.png;*.bmp;*.oct'}, 'Select File to Open');
           fullname = [filepath, filename];
           app.Image.ImageSource = fullname;
        end

        % Button pushed function: ConverttoarabicButton
        function converToArabic(app, event)
            
        end

        % Value changed function: ConvertednumberTextArea
        function insertArabicNumeral(app, event)
            value = app.ConvertednumberTextArea.Value;
            
        end

        % Image clicked function: Image
        function loadAndDisplayImage(app, event)

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.ScaleMethod = 'none';
            app.Image.ImageClickedFcn = createCallbackFcn(app, @loadAndDisplayImage, true);
            app.Image.Position = [67 130 390 257];

            % Create ConverttoarabicButton
            app.ConverttoarabicButton = uibutton(app.UIFigure, 'push');
            app.ConverttoarabicButton.ButtonPushedFcn = createCallbackFcn(app, @converToArabic, true);
            app.ConverttoarabicButton.Position = [467.5 53 107 22];
            app.ConverttoarabicButton.Text = 'Convert to arabic';

            % Create ConvertednumberTextAreaLabel
            app.ConvertednumberTextAreaLabel = uilabel(app.UIFigure);
            app.ConvertednumberTextAreaLabel.HorizontalAlignment = 'right';
            app.ConvertednumberTextAreaLabel.Position = [127 53 105 22];
            app.ConvertednumberTextAreaLabel.Text = 'Converted number';

            % Create ConvertednumberTextArea
            app.ConvertednumberTextArea = uitextarea(app.UIFigure);
            app.ConvertednumberTextArea.ValueChangedFcn = createCallbackFcn(app, @insertArabicNumeral, true);
            app.ConvertednumberTextArea.HorizontalAlignment = 'center';
            app.ConvertednumberTextArea.Position = [247 44 131 41];

            % Create LoadimageButton
            app.LoadimageButton = uibutton(app.UIFigure, 'push');
            app.LoadimageButton.ButtonPushedFcn = createCallbackFcn(app, @loadImage, true);
            app.LoadimageButton.Position = [472 130 100 22];
            app.LoadimageButton.Text = 'Load image';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
