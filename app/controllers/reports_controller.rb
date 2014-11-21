class ReportsController < ApplicationController

  def today
    @date = DateTime.now.strftime("%m/%d/%Y - %A")
    @tasks = Task.where('date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
    @projects = set_project_task_hash(Hash.new([]), @tasks)
  end
  
  def this_week
    @date = DateTime.now.beginning_of_week.strftime("%m/%d/%Y") + " - " + DateTime.now.end_of_week.strftime("%m/%d/%Y")
    @tasks = Task.where('date BETWEEN ? AND ?', DateTime.now.beginning_of_week, DateTime.now.end_of_week)
    @projects = set_project_task_hash(Hash.new([]), @tasks)
    
    render template: 'reports/today'
  end
  
  def this_month
    @date = DateTime.now.beginning_of_month.strftime("%m/%d/%Y") + " - " + DateTime.now.end_of_month.strftime("%m/%d/%Y")
    @tasks = Task.where('date BETWEEN ? AND ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month)
    @projects = set_project_task_hash(Hash.new([]), @tasks)
    
    render template: 'reports/today'
  end
  
  def dynamic
    
  end
  
  def date_range
    start_date = report_params[:start_date][:day] + "/" + report_params[:start_date][:month] + "/" + report_params[:start_date][:year]
    end_date = report_params[:end_date][:day] + "/" + report_params[:end_date][:month] + "/" + report_params[:end_date][:year]
    start_date = DateTime.parse(start_date)
    end_date = DateTime.parse(end_date)
    @date = start_date.strftime("%m/%d/%Y") + " - " + end_date.strftime("%m/%d/%Y")
    @tasks = Task.where('date BETWEEN ? AND ?', start_date.beginning_of_day, end_date.end_of_day)
    @projects = set_project_task_hash(Hash.new([]), @tasks)
    
    respond_to :js
  end
  
  private
  
  def set_project_task_hash(hash, tasks)
    tasks.each do |task|
      hash[task.project.name] += [task] if task.project.present?
    end
    hash
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:reports).permit!
  end
    
end
