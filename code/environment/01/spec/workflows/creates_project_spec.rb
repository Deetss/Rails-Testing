#---
# Excerpted from "Rails 5 Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrtest3 for more book information.
#---
#
require_relative '../active_record_spec_helper'
require 'devise'
require 'devise/orm/active_record'
require_relative '../../app/models/project'
require_relative '../../app/models/task'
require_relative '../../app/models/role'
require_relative '../../app/models/user'
require_relative '../../app/actions/creates_project'
#

RSpec.describe CreatesProject do

  let(:creator) { CreatesProject.new(
      name: "Project Runway", task_string: task_string) }

  describe "initialzation" do
    let(:task_string) { "" }
    it "creates a project given a name" do
      creator.build
      expect(creator.project.name).to eq("Project Runway")
    end
  end

  #

  describe "failure cases" do
    it "fails when trying to save a project with no name" do
      creator = CreatesProject.new(name: "", task_string: "")
      creator.create
      expect(creator).not_to be_a_success
    end
  end

  #

  #
  describe "mocking a failure" do
    it "fails when we say it fails" do
      project = instance_spy(Project, save: false)
      allow(Project).to receive(:new).and_return(project)
      creator = CreatesProject.new(name: "Name", task_string: "Task")
      creator.create
      expect(creator).not_to be_a_success
    end
  end
  ## END mock_failure

  describe "task string parsing" do
    let(:tasks) { creator.convert_string_to_tasks }

    describe "with an empty string" do
      let(:task_string) { "" }
      specify { expect(tasks).to be_empty }
    end

    describe "with a single string" do
      let(:task_string) { "Start Things" }
      specify { expect(tasks.size).to eq(1) }
      specify { expect(tasks.first).to have_attributes(
          title: "Start Things", size: 1) }
    end

    describe "with a single string with size " do
      let(:task_string) { "Start Things:3" }
      specify { expect(tasks.size).to eq(1) }
      specify { expect(tasks.first).to have_attributes(
          title: "Start Things", size: 3) }
    end

    describe "converting task strings to integers" do
      let(:task_string) { "" }
      specify { expect(creator.size_as_integer(nil)).to eq(1) }
      specify { expect(creator.size_as_integer("0")).to eq(1) }
      specify { expect(creator.size_as_integer("-1")).to eq(1) }
      specify { expect(creator.size_as_integer("2")).to eq(2) }
    end

    describe "with multiple tasks" do
      let(:task_string) { "Start Things:3\nEnd Things:2" }
      specify { expect(tasks.size).to eq(2) }
      specify {
        expect(tasks).to match([
          an_object_having_attributes(title: "Start Things", size: 3),
          an_object_having_attributes(title: "End Things", size: 2)])
      }
    end

    describe "attaches tasks to the project" do
      let(:task_string) { "Start Things:3\nEnd Things:2" }
      before(:example) { creator.create }
      specify { expect(creator.project.tasks.size).to eq(2) }
      specify { expect(creator.project).not_to be_a_new_record }
    end
  end

  #
  it "adds users to the project" do
    user = create(:user)
    creator = CreatesProject.new(name: "Project Runway", users: [user])
    creator.build
    expect(creator.project.users).to eq([user])
  end
  #

end
