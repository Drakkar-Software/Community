class PurgeStorageJob
  include Sidekiq::Worker
  sidekiq_options retry: 1

  def perform
    @errors = []

    ActiveStorage::Blob.unattached.where("active_storage_blobs.created_at <= ?", 2.days.ago).each do |blob|
      blob.purge_later
    end

    if @errors.empty?
      Sidekiq.logger.info('Job done.')
    else
      raise "Error when purging blob storage : \n#{@errors.join("\n")}"
    end
  end
end
