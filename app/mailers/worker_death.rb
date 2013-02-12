class WorkerDeath < ActionMailer::Base

    default :from => WarehouseTwo::Application.config.worker_death_from,
            :to => WarehouseTwo::Application.config.worker_death_to,
            :subject => "[#{Rails.env.upcase}] Warehouse 3 worker death"

  def failure(exception)
    @exception = exception
    mail( )
  end

end
