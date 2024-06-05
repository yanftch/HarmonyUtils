export class ClassFunctionGroupBean {
  parentId: number = 0
  parentName: string = ""
  childId: number = 0
  childName: string = ""
  toastMessage?: string

  constructor(parentId: number, parentName: string, childId: number, childName: string, toastMessage?: string) {
    this.parentId = parentId
    this.parentName = parentName
    this.childId = childId
    this.childName = childName
    this.toastMessage = toastMessage
  }
}
 