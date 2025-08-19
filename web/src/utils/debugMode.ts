import { isEnvBrowser } from "./envBrowser";

interface DebugEvent<T = any> {
  action: string;
  data: T;
}

class DebugSimulator {
  private static instance: DebugSimulator;
  private eventQueue: DebugEvent[] = [];
  private isActive = false;

  static getInstance(): DebugSimulator {
    if (!DebugSimulator.instance) {
      DebugSimulator.instance = new DebugSimulator();
    }
    return DebugSimulator.instance;
  }

  addEvent<T>(event: DebugEvent<T>): void {
    this.eventQueue.push(event);
  }

  addMultipleEvents<T>(events: DebugEvent<T>[]): void {
    this.eventQueue.push(...events);
  }

  simulateEvents(delay = 1000): void {
    if (!isEnvBrowser() || this.isActive) return;
    
    this.isActive = true;
    this.eventQueue.forEach((event, index) => {
      setTimeout(() => {
        this.dispatchEvent(event);
      }, delay * (index + 1));
    });
    
    this.eventQueue = [];
    this.isActive = false;
  }

  private dispatchEvent<T>(event: DebugEvent<T>): void {
    window.dispatchEvent(
      new MessageEvent("message", {
        data: {
          action: event.action,
          data: event.data,
        },
      })
    );
  }

  clearQueue(): void {
    this.eventQueue = [];
  }
}

export const debugSimulator = DebugSimulator.getInstance();
export const createDebugEvent = <T>(action: string, data: T): DebugEvent<T> => ({ action, data });
