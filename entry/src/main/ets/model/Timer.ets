@Observed
export default class Timer {
  goal: number = 20
  progress: number = 0;

  start() {
    setInterval(() => {
      this.progress++;
      if (this.progress > this.goal) {
        this.progress = 0
      }
    }, 1000)
  }
}