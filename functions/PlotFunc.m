function handles=PlotFunc(data,myfunc)
%% PlotFunc(data,plot_function_handle)
% Purpose: takes in a handle for a plotting function that operates on a
%          single DynaSim data structure and applies that function to each
%          element in a data structure array (e.g. the output of a
%          parameter sweep). Arranges the resulting plots in a grid similar
%          to PlotData and PlotFR2.
%          
% Inputs:
%   data: DynaSim data structure (see CheckData)
%   myfunc: Handle for plotting function. Running myfunc(data(1)) should
%   produce a plot. These plots will be arrayed in a grid of subplots. This
%   plotting function should not open any new figures and not contain
%   any subplots.
% 
% Examples:
% myfunc = @(x) plot(x.RS_V)
% % Single plot
% figure; myunc(data(1));
% % Grid of all plots
% PlotFunc(data,@myfunc)
% 
% 

% data=CheckData(data);
fields=fieldnames(data);
handles=[];



    
        %%
        
        % New code (imported from PlotData)
        num_sims=length(data); % number of simulations
        
        
        % make subplot adjustments for varied parameters
        if num_sims>1 && isfield(data,'varied')
          % collect info on parameters varied
          varied=data(1).varied;
          num_varied=length(varied); % number of model components varied across simulations
          num_sims=length(data); % number of data sets (one per simulation)
          % collect info on parameters varied
          param_mat=zeros(num_sims,num_varied); % values for each simulation
          param_cell=cell(1,num_varied); % unique values for each parameter
          % loop over varied components and collect values
          for j=1:num_varied
            if isnumeric(data(1).(varied{j}))
              param_mat(:,j)=[data.(varied{j})]; % values for each simulation
              param_cell{j}=unique([data.(varied{j})]); % unique values for each parameter
            else
              % todo: handle sims varying non-numeric model components 
              % (eg, mechanisms) (also in PlotFR and SelectData)
            end
          end
          param_size=cellfun(@length,param_cell); % number of unique values for each parameter
          % varied parameter with most elements goes along the rows (everything else goes along columns)
          row_param_index=find(param_size==max(param_size),1,'first');
          row_param_name=varied{row_param_index};
          row_param_values=param_cell{row_param_index};
          num_rows=length(row_param_values);
          %num_cols=num_sims/num_rows;
          num_figs=1;
          % collect sims for each value of the row parameter
          indices={};
          for row=1:num_rows
            indices{row}=find(param_mat(:,row_param_index)==row_param_values(row));
          end
          num_per_row=cellfun(@length,indices);
          num_cols=max(num_per_row);
          sim_indices=nan(num_cols,num_rows);
          % arrange sim indices for each row in a matrix
          for row=1:num_rows
            sim_indices(1:num_per_row(row),row)=indices{row};
          end
        %   sim_indices=[];
        %   for row=1:num_rows
        %     sim_indices=[sim_indices find(param_mat(:,row_param_index)==row_param_values(row))];
        %   end
        else
          sim_indices=ones(1,num_rows); % index into data array
          num_cols=1;
        end
        
        ht=320; % height per subplot row (=per population or FR data set)
        handles(1) = figure('units','normalized','position',[0,1-min(.33*num_rows,1),min(.25*num_cols,1) min(.33*num_rows,1)]);
        hsp = subplot_grid(num_rows,num_cols);
        
        axis_counter = 0;
        for row=1:num_rows
            for col=1:num_cols
                
                sim_index=sim_indices(col,row); % index into data array for this subplot
                axis_counter=axis_counter+1; % number subplot axis we're on
                if isnan(sim_index)
                  continue;
                end
                
                hsp.set_gca(axis_counter);
                
                num_pops = 1;
                if isfield(data,'varied')
                  if num_sims>1
                    % list the parameter varied along the rows first
                    str=[row_param_name '=' num2str(row_param_values(row)) ': '];
                    for k=1:num_varied
                      fld=data(sim_index).varied{k};
                      if ~strcmp(fld,row_param_name)
                        val=data(sim_index).(fld);
                        str=[str fld '=' num2str(val) ', '];
                      end
                    end
                    if num_pops>1
                      legend_strings=cellfun(@(x)[x ' (mean)'],pop_names,'uni',0);
                    end
                  else
                    str='';
                    for k=1:length(data.varied)
                      fld=data(sim_index).varied{k};
                      str=[str fld '=' num2str(data(sim_index).(fld)) ', '];
                    end
                  end
                  text_string{row,col}=['(' strrep(str(1:end-2),'_','\_') ')'];
                end
        

                k=1;
                i=sim_index;
                
                
                % get population name from field (assumes: pop_*)
                
                
                % 1.0 plot firing rate heat map
                    %hsp.figtitle([ text_string{row,col}]);
                    
                    myfunc(data(i));
                    title(text_string{row,col});
                    
                    
                    
                
                
            end
        end
    
end
