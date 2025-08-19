/**
 * Sends data to the client script via NUI
 * @param eventName - Target endpoint event name
 * @param data - Data to send in the NUI callback
 * @returns Promise with the response data
 */
export async function sendNuiFetch<T = any>(
  eventName: string,
  data: unknown = {}
): Promise<T> {
  const config = {
    method: "post",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(data),
  };

  const resource = (window as any).GetParentResourceName
    ? (window as any).GetParentResourceName()
    : "nui-frame-app";

  try {
    const response = await fetch(`https://${resource}/${eventName}`, config);
    
    // Check if response has content before trying to parse JSON
    const text = await response.text();
    if (text && text.trim() !== '') {
      return JSON.parse(text);
    }
    
    return {} as T;
  } catch (error) {
    console.error(`Error sending NUI message to ${eventName}:`, error);
    return {} as T;
  }
}
