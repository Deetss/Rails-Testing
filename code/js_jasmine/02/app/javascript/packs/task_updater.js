/***
 * Excerpted from "Rails 5 Test Prescriptions",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/nrtest3 for more book information.
***/
export class TaskUpdater {
  constructor(task, upOrDown) {
      this.task = task;
    this.upOrDown = upOrDown
  }

  update() {
      const url = `/tasks/${this.task.id}/${this.upOrDown}.json`;
    $.ajax({
      url,
      beforeSend: xhr => {
        xhr.setRequestHeader(
          "X-CSRF-Token",
          $('meta[name="csrf-token"]').attr("content")
        )
      },
      {
          "PATCH"
      }
  ,
      "POST"
    })
  }
}
