require 'mail'
require_relative '/home/karthickraja/.lib/mail_gem_helper'

class ProactiveReporter
  attr_writer :days_before
  def initialize
    @days_before=0
  end

  def call
    # n=ARGV[0].to_i # Require when we are operating this script with cli.
    # n||=0

    date=Date.today.prev_day(@days_before.to_i)

    dirpath="/home/karthickraja/Delivery/Pro-active/Health_check/#{date.strftime('%Y/%B')}/"
    report_filepath="#{dirpath}Overall_Axis_HC_report_#{date.strftime('%d%m%Y')}.txt"
    report_spreadsheet="#{dirpath}AxisHealthCheck.xls"

    from='karthickraja@bksys.co.in'
    #to='roadmap@bksys.co.in'
    to='pcteam@bksys.co.in'
    subject="Axis Servers Overall Healthcheck Report for #{date.strftime('%d/%m/%Y')}"


    #puts "Summary for health check:"
    body="Dear Team,\n\tKindly find the attached spreed sheet and overall report which is a consolidated report of reviewers.\n"
    body+="Note : \n"
    # FIXME Need to add tab for every line.
    body+=STDIN.gets("\t\n").chomp.sub(/^/,"\t")
    body+="\n--\nRegards,\nKarthickraja"

    initiate_mail_connection
    report_mail=Mail.new
    report_mail[:from]=from
    report_mail[:to]=to
    report_mail[:bcc]="karthickraja@bksys.co.in"
    report_mail[:subject]=subject
    report_mail[:body]=body
    report_mail.add_file report_filepath
    report_mail.add_file report_spreadsheet

    puts report_mail[:to]
    puts report_mail[:subject]
    puts report_mail[:body]
    puts report_filepath
    puts report_spreadsheet


    #puts "Shall I send the mail....[Y/n] : "
    #STDIN.flush
    #choice=gets
    #puts choice.chomp

    report_mail.deliver
  end # For method
end # for class

