# frozen_string_literal: true

desc 'Generate transcription from a meeting recording'
task transcribe_meeting: [:environment] do
  meeting_id = ENV.fetch('meeting_id')

  meeting = Meeting.find(meeting_id)

  LOCAL_REC_DIR = 'tmp/local_recordings'

  Rails.logger.info("Ensuring local recordings location exists")
  FileUtils.mkdir_p(LOCAL_REC_DIR)

  full_recording_filename = "#{LOCAL_REC_DIR}/original_recording_#{meeting_id}#{File.extname(meeting.recording_url)}"
  if File.exist?(full_recording_filename)
    Rails.logger.info("Downloaded recording already exists, skipping download")
  else
    Rails.logger.info("Downloading meeting recording from url: #{meeting.recording_url}")
    `wget -O #{full_recording_filename} #{meeting.recording_url} `
  end

  PROCESSED_REC_DIR = 'tmp/processed_recordings'
  FileUtils.mkdir_p(PROCESSED_REC_DIR)

  audio_filename = "#{PROCESSED_REC_DIR}/audio_only_#{meeting_id}#{File.extname(meeting.recording_url)}"

  Rails.logger.info("Stripping out audio from video")
  `ffmpeg -i #{full_recording_filename} -vn -acodec copy #{audio_filename}`

  transcription_filename = "#{File.dirname(audio_filename)}/#{File.basename(audio_filename, File.extname(audio_filename))}.json"
  if File.exist?(transcription_filename)
    Rails.logger.info("Transcription exists at #{transcription_filename}. Skipping transcription")
  else
    Rails.logger.info("Generating Transcription")
    `whisper --model medium --task transcribe --language en --output_format json --output_dir #{PROCESSED_REC_DIR} #{audio_filename}`
  end
end

desc 'Import a transcription for a meeting'
task import_transcription: [:environment] do
  meeting_id = ENV.fetch('meeting_id')
end