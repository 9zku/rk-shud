import { onUnmounted } from "vue";

type NuiMessage<T = unknown> = {
  action: string;
  data: T;
};

type NuiHandler<T = any> = (data: T) => void;

const useNuiListeners = new Map<string, NuiHandler[]>();

const useNuiHandleMessage = (event: MessageEvent<NuiMessage>) => {
  const { action, data } = event.data;
  const handlers = useNuiListeners.get(action);

  if (handlers) {
    handlers.forEach(handler => handler(data));
  }
};

window.addEventListener("message", useNuiHandleMessage);

/**
 * Hook for managing NUI event listeners
 * @param action - The action to listen for
 * @param handler - Callback function to handle the data
 * 
 * @example
 * useNuiEvent<{visible: boolean}>('toggle', (data) => {
 *   console.log('Visibility:', data.visible);
 * });
 */
export function useNuiEvent<T = unknown>(
  action: string,
  handler: NuiHandler<T>
) {
  const currentHandlers = useNuiListeners.get(action) || [];
  currentHandlers.push(handler);
  useNuiListeners.set(action, currentHandlers);

  onUnmounted(() => {
    const handlers = useNuiListeners.get(action) || [];
    useNuiListeners.set(action, handlers.filter(h => h !== handler));
  });
}
