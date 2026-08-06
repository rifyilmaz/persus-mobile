part of '../case_file_entry_page.dart';

extension _CaseFileEntryFormRouter on _CaseFileEntryPageState {
  Widget _buildSelectedForm() {
    if (_selectedMainType == CaseMainType.icra) {
      if (_isEmptyIcraPage) {
        return const SizedBox.shrink();
      }

      if (_isIcraEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    if (_selectedMainType ==
        CaseMainType.bilgiBelge) {
      if (_isEmptyBilgiBelgePage) {
        return const SizedBox.shrink();
      }

      if (_isBilgiBelgeEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType:
              _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    if (_selectedMainType == CaseMainType.gorus) {
      return _GorusFormCard(
        fieldBuilder: _textField,
        dateBuilder: _dateField,
        dropdownBuilder: _dropdownField,
        lookupBuilder: _lookupField,
        nextRecordNumber: (_records.length + 1).toString(),
      );
    }

    if (_selectedMainType == CaseMainType.diger) {
      if (_isEmptyDigerPage) {
        return const SizedBox.shrink();
      }

      if (_isDigerEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType !=
            DavaSubType.arabuluculuk) {
      if (_isEmptyDavaPage) {
        return const SizedBox.shrink();
      }

      if (_isDavaEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    switch (_selectedSection) {
      case CaseFormSection.temel:
        return _TemelBilgilerFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      case CaseFormSection.istinaf:
        return _AppealInfoFormCard(
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      case CaseFormSection.odeme:
        return _PaymentInfoFormCard(
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
        );
      case CaseFormSection.seri:
        return const _SeriesSyncFormCard();
      case CaseFormSection.bosSeri:
        if (_selectedMainType == CaseMainType.dava &&
            _selectedDavaSubType ==
                DavaSubType.arabuluculuk) {
          return _ArbitrationFormCard(
            emptySerialMode: true,
            fieldBuilder: _textField,
            dateBuilder: _dateField,
            dropdownBuilder: _dropdownField,
            lookupBuilder: _lookupField,
          );
        }

        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );

      case CaseFormSection.arabuluculukDava:
        return _ArbitrationFormCard(
          emptySerialMode: false,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );

      case CaseFormSection.iliskiliDosyalar:
        return const SizedBox.shrink();

      case CaseFormSection.toplantiYeri:
        return const SizedBox.shrink();
    }
  }
}