function app_practice_table_default2 (value, app)

            
switch value
    case 'Default 3'
            TMP = cell(4,4);
            TMP(1,:) = {'row1col1','row1col2','row1col3','row1col4'};
            TMP(2,:) = {'row2col1','row2col2','row2col3','row2col4'};
            TMP(3,:) = {'row3col1','row3col2','row3col3','row3col4'};
            TMP(4,:) = {'row4col1','row4col2','row4col3','row4col4'};
            app.UITable.Data = TMP;
            
        case 'Default 4'
            TMP = cell(4,4);
            TMP(1,:) = {'row1col1','row1col2','row1col3','row1col4'};
            TMP(2,:) = {'row2col1','row2col2','row2col3','row2col4'};
            TMP(3,:) = {'row3col1','row3col2','row3col3','row3col4'};
            TMP(4,:) = {'row4col1','row4col2','row4col3','row4col4'};
            app.UITable.Data = TMP;
            
end
end