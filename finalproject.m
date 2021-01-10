function finalproject
f_menu = figure('Position', [1 2 2*303 2*380], 'Visible', 'on', 'MenuBar', 'none', 'Color', 'White');
movegui(f_menu, 'center')
statictitle = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*300 2*303 2*40], 'String', 'Which pet is right for you?', 'FontSize', 30);
static1 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [-210 2*250 2*303 2*40], 'String', 'Instructions:', 'FontSize', 20);
static2 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [-90 2*200 2*303 2*40], 'String', '1. Read the options that are available to you.', 'FontSize', 15);
static3 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [-10 2*150 2*303 2*40], 'String', '2. Enter a single choice in lowercase letters or a single number without the "." after it.', 'FontSize', 15 );
static4 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*100 2*303 2*40], 'String', '3. Press the "Next" button at the bottom of the screen to continue.', 'FontSize', 15);
edit1 = uicontrol('Style', 'text', 'FontSize', 20, 'BackgroundColor', 'White', 'Position', [1 2*50 2*303 2*40]);
button1 = uicontrol('Style', 'pushbutton', 'String', 'Start Quiz', 'FontSize', 20, 'Position',[1 2*55 2*303 2*40], 'Callback', @questions);
button2 = uicontrol('Style', 'pushbutton', 'String', 'Pet Database', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @database);
    function questions(source, eventdata)
        statictitle = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*300 2*303 2*40], 'String', 'Where do you live?', 'FontSize', 20);
        static1 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*250 2*303 2*40], 'String', 'a. City', 'FontSize', 20);
        static2 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*200 2*303 2*40], 'String', 'b. Suburbs', 'FontSize', 20);
        static3 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*150 2*303 2*40], 'String', 'c. Rural Area', 'FontSize', 20);
        static4 = uicontrol('Style', 'text', 'BackgroundColor', 'White', 'Position', [1 2*100 2*303 2*40], 'FontSize', 20);
        edit1 = uicontrol('Style', 'edit', 'FontSize', 20, 'BackgroundColor', 'White', 'Position', [1 2*55 2*303 2*40]);
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback1);
        function callback1(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'w');
            if fid ~= -1
                if x == 'a'
                    fprintf(fid, 'Where do you live?: City \r\n');
                    fclose(fid);
                    question2
                elseif x == 'b'
                    fprintf(fid, 'Where do you live?: Suburbs\r\n');
                    fclose(fid);
                    question2
                elseif x == 'c'
                    fprintf(fid, 'Where do you live?: Country\r\n');
                    fclose(fid);
                    question3
                end
            end
        end
    end
    function question2
        set(statictitle, 'String', 'How busy are you on a scale of 1 to 10?');
        set(static1, 'String', '');
        set(static2, 'String', '');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback2);
        function callback2(source,eventdata)
            x = [str2num(get(edit1, 'String'))];
            fid = fopen('results.txt', 'a');
            if x < 5
                fprintf(fid,'How busy are you (1-10)?: %d\r\n', x);
                fclose(fid);
                question4
            elseif x >= 5
                fprintf(fid,'How busy are you (1-10)?: %d\r\n', x);
                fclose(fid);
                question5
            end
        end
    end


    function question4
        set(statictitle, 'String', 'Do you want your pet to greet you at the door?');
        set(static1, 'String', 'a. Yes');
        set(static2, 'String', 'b. No');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback4);
        function callback4(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid,'Do you want your pet to greet you?: Yes\r\n');
                fclose(fid);
                question6
            elseif x == 'b'
                fprintf(fid,'Do you want your pet to greet you?: No\r\n');
                fclose(fid);
                displayrabbit
            end
        end
    end

    function question6
        set(statictitle, 'String', 'Would you rather be...');
        set(static1, 'String', 'a. Indoors');
        set(static2, 'String', 'b. Outdoors');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback6);
        function callback6(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'You would rather be: Indoors\r\n');
                fclose(fid);
                displaycat
            elseif x == 'b'
                fprintf(fid, 'You would rather be: Outdoors\r\n');
                fclose(fid);
                displaydog
            end
        end
    end


    function question5
        set(statictitle, 'String', 'What time do you usually get home?');
        set(static1, 'String', 'a. 5pm');
        set(static2, 'String', 'b. 6pm');
        set(static3, 'String', 'c. 7pm');
        set(static4, 'String', 'd. 8pm');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback5);
        function callback5(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'What time do you usually get home?: 5pm\r\n');
                fclose(fid);
                question7
            elseif x == 'b'
                fprintf(fid, 'What time do you usually get home?: 6pm\r\n');
                fclose(fid);
                question7
            elseif x == 'c'
                fprintf(fid, 'What time do you usually get home?: 7pm\r\n');
                fclose(fid);
                question8
            elseif x == 'd'
                fprintf(fid, 'What time do you usually get home?: 8pm\r\n');
                fclose(fid);
                question8
            end
            
        end
    end

    function question8
        set(statictitle, 'String', 'How responsible are you on a scale of 1 to 10?');
        set(static1, 'String', '');
        set(static2, 'String', '');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            x = [str2num(get(edit1, 'String'))];
            fid = fopen('results.txt', 'a');
            if x < 5
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                displayrock
            elseif x >= 5
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                displayfish
            end
        end
    end

    function question7
        set(statictitle, 'String', 'How responsible are you on a scale of 1 to 10?');
        set(static1, 'String', '');
        set(static2, 'String', '');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback7);
        function callback7(source,eventdata)
            x = [str2num(get(edit1, 'String'))];
            fid = fopen('results.txt', 'a');
            if x < 4
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                displayrock
            elseif x >= 4 && x <= 6
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                displayfish
            elseif x >= 7 && x <= 10
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                displaycat
            end
        end
    end

    function question3
        set(statictitle, 'String', 'How responsible are you on a scale of 1 to 10?');
        set(static1, 'String', '');
        set(static2, 'String', '');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback3);
        function callback3(source,eventdata)
            x = [str2num(get(edit1, 'String'))];
            fid = fopen('results.txt', 'a');
            if x < 2
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                question9
            elseif x >= 3 && x <= 4
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                question10
            elseif x >= 5 && x <= 10
                fprintf(fid, 'How responsible are you (1-10)?: %d\r\n', x);
                fclose(fid);
                question11
            end
        end
    end

    function question9
        set(statictitle, 'String', 'How do you live your life?');
        set(static1, 'String', 'a. Under a rock');
        set(static2, 'String', 'b. Colorfully');
        set(static3, 'String', 'c. Actively');
        set(static4, 'String', 'd, Lazily');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback9);
        function callback9(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'How do you live your life?: Under a rock \r\n');
                fclose(fid);
                displayrock
            elseif x == 'd'
                fprintf(fid, 'How do you live your life?: Lazily \r\n');
                fclose(fid);
                displayrock
            elseif x == 'b'
                fprintf(fid, 'How do you live your life?: Colorfully \r\n');
                fclose(fid);
                displayfish
            elseif x == 'c'
                fprintf(fid, 'How do you live your life?: Actively \r\n');
                fclose(fid);
                displayfish
            end
        end
    end

    function question10
        set(statictitle, 'String', 'Do you want your pet to greet you at the door?');
        set(static1, 'String', 'a. Yes');
        set(static2, 'String', 'b. No');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback10);
        function callback10(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'Do you want your pet to greet you?: Yes \r\n');
                fclose(fid);
                displaycat
            elseif x == 'b'
                fprintf(fid, 'Do you want your pet to greet you?: No \r\n');
                fclose(fid);
                displayrabbit
            end
        end
    end

    function question11
        set(statictitle, 'String', 'Would you describe yourself as...?');
        set(static1, 'String', 'a. Empathetic');
        set(static2, 'String', 'b. Practical');
        set(static3, 'String', 'c. A food-lover');
        set(static4, 'String', 'd. Outgoing');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback11);
        function callback11(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'How would you best describe yourself?: Empathetic \r\n');
                fclose(fid);
                question13
            elseif x == 'd'
                fprintf(fid, 'How would you best describe yourself?: Outgoing \r\n');
                fclose(fid);
                question13
            elseif x == 'b'
                fprintf(fid, 'How would you best describe yourself?: Practical \r\n');
                fclose(fid);
                question12
            elseif x == 'c'
                fprintf(fid, 'How would you best describe yourself?: A food-lover \r\n');
                fclose(fid);
                question12
            end
        end
    end

    function question12
        set(statictitle, 'String', 'How much land do you own?');
        set(static1, 'String', 'a. Less than 5 acres');
        set(static2, 'String', 'b. More than 5 acres');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback12);
        function callback12(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'How much land do you own?: Less than 5 acres \r\n');
                fclose(fid);
                displayhen
            elseif x == 'b'
                fprintf(fid, 'How much land do you own?: More than 5 acres \r\n');
                fclose(fid);
                displaycow
            end
        end
    end

    function question13
        set(statictitle, 'String', 'How much land do you own?');
        set(static1, 'String', 'a. Less than 5 acres');
        set(static2, 'String', 'b. More than 5 acres');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback13);
        function callback13(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'How much land do you own?: Less than 5 acres \r\n');
                fclose(fid);
                question14
            elseif x == 'b'
                fprintf(fid, 'How much land do you own?: More than 5 acres \r\n');
                fclose(fid);
                displayhorse
            end
        end
    end

    function question14
        set(statictitle, 'String', 'Do you want your pet to greet you at the door?');
        set(static1, 'String', 'a. Yes');
        set(static2, 'String', 'b. No');
        set(static3, 'String', '');
        set(static4, 'String', '');
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Next', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback14);
        function callback14(source,eventdata)
            x = get(edit1, 'String');
            fid = fopen('results.txt', 'a');
            if x == 'a'
                fprintf(fid, 'Do you want your pet to greet you?: Yes \r\n');
                fclose(fid);
                question6
            elseif x == 'b'
                fprintf(fid, 'Do you want your pet to greet you?: No \r\n');
                fclose(fid);
                displayrabbit
            end
        end
    end

    function displayrabbit
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Rabbit!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displaycat
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Cat!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displaydog
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Dog!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displayrock
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Rock!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displayfish
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Fish!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displayhorse
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Horse!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displayhen
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Laying Hen!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function displaycow
        set(statictitle, 'String', 'Congratulations!');
        set(static1, 'String', '');
        set(static2, 'String', 'You have been matched');
        set(static3, 'String', 'with a pet');
        set(static4, 'String', 'Dairy Cow!', 'FontSize', 25);
        set(edit1, 'String', '');
        button = uicontrol('Style', 'pushbutton', 'String', 'Display Results', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callback8);
        function callback8(source,eventdata)
            uiopen('results.txt');
        end
    end

    function database(source,eventdata)
        set(statictitle,'Position', [1 2*300 2*303 2*40], 'String', 'Pet Database', 'FontSize', 30);
        set(static1,'Position', [1 2*200 2*310 2*50], 'String', 'Search', 'FontSize', 20);
        set(static2,'Position', [1 2*250 2*310 40], 'String', 'Case Sensitive: Search using lowercase letters only', 'FontSize', 15);
        set(static3,'Position', [1 1 1 1], 'String', '', 'FontSize', 15 );
        set(static4,'Position', [1 1 1 1], 'String', '', 'FontSize', 15);
        set(edit1,'Style', 'edit', 'FontSize', 15, 'Position', [240 2*150 2*70 2*40]);
        set(button1,'String', '', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @questions);
        
        set(button2,'String', 'Submit', 'FontSize', 20, 'Position',[1 2*1 2*303 2*40], 'Callback', @callbackDatabase);
        function callbackDatabase(source,eventdata)
            x = get(edit1, 'String');
            Database(1) = struct('name', 'rock', 'info', 'Rocks are ideal for either very busy or lazy people. They also work for those who can not own pets of their own due to living arrangements');
            Database(2) = struct('name', 'fish', 'info', 'Fish are for those that are busy, but whould love to have a pet.');
            Database(3) = struct('name', 'chicken', 'info','Chickens lay delicous eggs that can be eaten or sold to help pay for the chicken feed.');
            Database(4) = struct('name', 'rabbit', 'info','Rabbits can be litter trained and, if raised correctly, are very compassionate.' );
            Database(5) = struct('name', 'dog', 'info', 'Dogs are very loyal, but take a lot of work. Therefore busy people are not recommened to own them.');
            Database(6) = struct('name', 'dairy cow', 'info', 'Dairy Cows provide you with delicious milk and are practical animals if you have the room and money.');
            Database(7) = struct('name', 'cat', 'info', 'Cats are often aloof, but if you are kind to them, they will snuggle with you when you are sad or sick.');
            Database(8) = struct('name', 'horse', 'info', 'Horses are the best companions.Most horses you have a good relationship with are loyal too. For example,if you jump off their back onto a haybale, they will not ride off and leave you stranded. They are not to be owned by people too busy to ride them.');
            found = -1;
            for i = 1:length(Database)
                if strcmp(x, Database(i).name)
                    x = sprintf( '%s', Database(i).info);
                    found = i;
                end
            end
            if found >= 1
                set(static1, 'String', x)
            else
                set(static1, 'String', 'Error: This animal is not in our database')
                
            end
            
        end
    end
end