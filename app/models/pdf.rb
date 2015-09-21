class Pdf < ActiveRecord::Base
	belongs_to :template
  has_many :types, dependent: :destroy
  
  has_attached_file :file, path: '/pdfs/:id/:basename_:style.:extension',
  :s3_host_name => 's3-us-west-1.amazonaws.com',
    styles: { thumbnail: ['35x35^', :png] }
  
  validates_presence_of :name, :template
  validates_attachment :file, presence: true, content_type: {
    content_type: 'application/pdf' }
end