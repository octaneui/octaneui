import { FileInput } from "octane-ui";
import { Paperclip } from "octane-icons/lucide";

export function FileInputExamples() @{
  <>
    <FileInput aria-label="Upload file" />
    <FileInput
      left={<Paperclip size={16} />}
      aria-label="Attachments"
      multiple
      accept="image/*"
    />
    <FileInput aria-label="Disabled" disabled />
  </>
}
